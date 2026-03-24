#!/usr/bin/env python3
import asyncio
import csv
import random
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import httpx


CVE_PATTERN = re.compile(r"CVE-\d{4}-\d+", re.IGNORECASE)
RHSA_PATTERN = re.compile(r"RHSA-\d{4}:\d+", re.IGNORECASE)

CSAF_URL = "https://access.redhat.com/hydra/rest/securitydata/csaf/{rhsa}.json"
CVRF_URL = "https://access.redhat.com/hydra/rest/securitydata/cvrf/{rhsa}.json"
ERRATA_URL = "https://access.redhat.com/errata/{rhsa}"


@dataclass(frozen=True)
class Finding:
    plugin_id: str
    package: str
    rhsa: str


def parse_acas(csv_path: Path) -> list[Finding]:
    findings: list[Finding] = []

    with csv_path.open("r", encoding="utf-8-sig", newline="") as f:
        reader = csv.DictReader(f)

        for row in reader:
            script_name = (row.get("Script Name") or row.get("Name") or "").strip()
            plugin_id = (row.get("Plugin") or row.get("Plugin ID") or "").strip()

            if not script_name:
                continue

            rhsa_match = RHSA_PATTERN.search(script_name)
            if not rhsa_match:
                continue

            rhsa = rhsa_match.group(0).upper()

            try:
                package = script_name.split(":", 1)[1].split("(", 1)[0].strip()
            except Exception:
                continue

            if not package:
                continue

            findings.append(
                Finding(
                    plugin_id=plugin_id,
                    package=package,
                    rhsa=rhsa,
                )
            )

    return findings


def unique_rhsa_package_pairs(findings: list[Finding]) -> list[tuple[str, str]]:
    return sorted({(finding.rhsa, finding.package) for finding in findings})


def extract_cves_from_text(text: str) -> list[str]:
    return sorted({match.group(0).upper() for match in CVE_PATTERN.finditer(text)})


def extract_cves_from_json(payload: dict[str, Any]) -> list[str]:
    found: set[str] = set()

    vulnerabilities = payload.get("vulnerabilities", [])
    if isinstance(vulnerabilities, list):
        for item in vulnerabilities:
            if not isinstance(item, dict):
                continue

            for key in ("cve", "title"):
                value = item.get(key)
                if isinstance(value, str):
                    for match in CVE_PATTERN.findall(value):
                        found.add(match.upper())

            cve_value = item.get("cve")
            if isinstance(cve_value, str):
                for match in CVE_PATTERN.findall(cve_value):
                    found.add(match.upper())

            ids = item.get("ids")
            if isinstance(ids, list):
                for entry in ids:
                    if isinstance(entry, dict):
                        text = str(entry.get("text", ""))
                        for match in CVE_PATTERN.findall(text):
                            found.add(match.upper())

    if found:
        return sorted(found)

    def walk(value: Any) -> None:
        if isinstance(value, dict):
            for subvalue in value.values():
                walk(subvalue)
        elif isinstance(value, list):
            for item in value:
                walk(item)
        elif isinstance(value, str):
            for match in CVE_PATTERN.findall(value):
                found.add(match.upper())

    walk(payload)
    return sorted(found)


def get_retry_after_seconds(response: httpx.Response) -> float | None:
    retry_after = response.headers.get("Retry-After")
    if not retry_after:
        return None

    try:
        return max(float(retry_after), 0.0)
    except ValueError:
        return None


async def get_with_backoff(
    client: httpx.AsyncClient,
    url: str,
    max_attempts: int = 5,
    base_delay: float = 0.5,
    max_delay: float = 8.0,
) -> httpx.Response:
    last_error: Exception | None = None

    for attempt in range(1, max_attempts + 1):
        try:
            response = await client.get(url)

            if response.status_code == 429 or 500 <= response.status_code < 600:
                if attempt == max_attempts:
                    response.raise_for_status()

                retry_after = get_retry_after_seconds(response)
                if retry_after is not None:
                    delay = min(retry_after, max_delay)
                else:
                    delay = min(base_delay * (2 ** (attempt - 1)), max_delay)
                    delay += random.uniform(0, 0.25)

                print(
                    "Retryable status {0} for {1} on attempt {2}/{3}; sleeping {4:.2f}s".format(
                        response.status_code, url, attempt, max_attempts, delay
                    )
                )
                await asyncio.sleep(delay)
                continue

            response.raise_for_status()
            return response

        except (
            httpx.ReadTimeout,
            httpx.ConnectTimeout,
            httpx.RemoteProtocolError,
            httpx.ConnectError,
        ) as exc:
            last_error = exc
            if attempt == max_attempts:
                raise

            delay = min(base_delay * (2 ** (attempt - 1)), max_delay)
            delay += random.uniform(0, 0.25)

            print(
                "Transient error {0} for {1} on attempt {2}/{3}; sleeping {4:.2f}s".format(
                    exc.__class__.__name__, url, attempt, max_attempts, delay
                )
            )
            await asyncio.sleep(delay)

    if last_error is not None:
        raise last_error

    raise RuntimeError("Unexpected retry loop exit for URL: {0}".format(url))


def build_result(
    rhsa: str,
    source: str,
    url: str,
    cves: list[str],
    status_code: int | str,
    error_detail: str,
) -> dict[str, Any]:
    return {
        "rhsa": rhsa,
        "source": source,
        "url": url,
        "cves": cves,
        "status_code": status_code,
        "error_detail": error_detail,
    }


async def try_json_source(
    client: httpx.AsyncClient,
    rhsa: str,
    url: str,
    source_name: str,
) -> dict[str, Any] | None:
    try:
        response = await get_with_backoff(client, url)
        payload = response.json()
        cves = extract_cves_from_json(payload)

        if cves:
            return build_result(
                rhsa=rhsa,
                source=source_name,
                url=url,
                cves=cves,
                status_code=response.status_code,
                error_detail="",
            )

        return build_result(
            rhsa=rhsa,
            source=source_name + "_empty",
            url=url,
            cves=[],
            status_code=response.status_code,
            error_detail="No CVEs found in JSON payload",
        )
    except Exception as exc:
        return build_result(
            rhsa=rhsa,
            source=source_name + "_error",
            url=url,
            cves=[],
            status_code="",
            error_detail=repr(exc),
        )


async def try_html_source(
    client: httpx.AsyncClient,
    rhsa: str,
    url: str,
) -> dict[str, Any]:
    try:
        response = await get_with_backoff(client, url)
        cves = extract_cves_from_text(response.text)

        if cves:
            return build_result(
                rhsa=rhsa,
                source="html_text",
                url=url,
                cves=cves,
                status_code=response.status_code,
                error_detail="",
            )

        return build_result(
            rhsa=rhsa,
            source="html_empty",
            url=url,
            cves=[],
            status_code=response.status_code,
            error_detail="No CVEs found in HTML response",
        )
    except Exception as exc:
        return build_result(
            rhsa=rhsa,
            source="error",
            url=url,
            cves=[],
            status_code="",
            error_detail=repr(exc),
        )


async def fetch_cves_for_rhsa(
    client: httpx.AsyncClient,
    rhsa: str,
) -> dict[str, Any]:
    rhsa = rhsa.upper().strip()

    csaf_url = CSAF_URL.format(rhsa=rhsa)
    csaf_result = await try_json_source(client, rhsa, csaf_url, "csaf_json")
    if csaf_result["cves"]:
        return csaf_result

    cvrf_url = CVRF_URL.format(rhsa=rhsa)
    cvrf_result = await try_json_source(client, rhsa, cvrf_url, "cvrf_json")
    if cvrf_result["cves"]:
        return cvrf_result

    errata_url = ERRATA_URL.format(rhsa=rhsa)
    html_result = await try_html_source(client, rhsa, errata_url)
    if html_result["cves"]:
        return html_result

    details = "csaf={0}; cvrf={1}; html={2}".format(
        csaf_result.get("error_detail", ""),
        cvrf_result.get("error_detail", ""),
        html_result.get("error_detail", ""),
    )

    return build_result(
        rhsa=rhsa,
        source="error",
        url=errata_url,
        cves=[],
        status_code="",
        error_detail=details,
    )


async def build_rhsa_map(
    findings: list[Finding],
    output_csv: Path,
    failures_csv: Path,
    concurrency: int = 15,
) -> None:
    pairs = unique_rhsa_package_pairs(findings)
    rhsas = sorted({rhsa for rhsa, _ in pairs})

    timeout = httpx.Timeout(connect=10.0, read=20.0, write=20.0, pool=20.0)
    limits = httpx.Limits(max_keepalive_connections=20, max_connections=40)
    semaphore = asyncio.Semaphore(concurrency)

    async with httpx.AsyncClient(
        timeout=timeout,
        limits=limits,
        headers={"User-Agent": "RHSA-CVE-Collector/1.0"},
        follow_redirects=True,
    ) as client:

        async def bounded_fetch(rhsa: str) -> tuple[str, dict[str, Any]]:
            async with semaphore:
                print("Fetching {0}".format(rhsa))
                result = await fetch_cves_for_rhsa(client, rhsa)
                return rhsa, result

        results = await asyncio.gather(*(bounded_fetch(rhsa) for rhsa in rhsas))
        rhsa_cache = dict(results)

    with output_csv.open("w", encoding="utf-8", newline="") as wf:
        writer = csv.writer(wf)
        writer.writerow(["rhsa", "package", "cve", "source", "url", "status_code", "error_detail"])

        for rhsa, package in pairs:
            result = rhsa_cache[rhsa]
            cves = result.get("cves", [])

            if cves:
                for cve in cves:
                    writer.writerow([
                        rhsa,
                        package,
                        cve,
                        result["source"],
                        result["url"],
                        result["status_code"],
                        result["error_detail"],
                    ])
            else:
                writer.writerow([
                    rhsa,
                    package,
                    "",
                    result["source"],
                    result["url"],
                    result["status_code"],
                    result["error_detail"],
                ])

    with failures_csv.open("w", encoding="utf-8", newline="") as wf:
        writer = csv.writer(wf)
        writer.writerow(["rhsa", "source", "url", "status_code", "error_detail"])

        for rhsa in rhsas:
            result = rhsa_cache[rhsa]
            if not result.get("cves"):
                writer.writerow([
                    rhsa,
                    result["source"],
                    result["url"],
                    result["status_code"],
                    result["error_detail"],
                ])


async def main() -> None:
    input_csv = Path("rhsa_ni.csv")
    output_csv = Path("rhsa_cve_map.csv")
    failures_csv = Path("rhsa_scrape_failures.csv")

    findings = parse_acas(input_csv)

    if not findings:
        print("No RHSA findings found in {0}".format(input_csv))
        return

    await build_rhsa_map(
        findings=findings,
        output_csv=output_csv,
        failures_csv=failures_csv,
        concurrency=15,
    )

    unique_pairs = unique_rhsa_package_pairs(findings)
    unique_rhsas = sorted({rhsa for rhsa, _ in unique_pairs})

    print("Parsed {0} findings".format(len(findings)))
    print("Found {0} unique RHSA/package pairs".format(len(unique_pairs)))
    print("Fetched {0} unique RHSAs".format(len(unique_rhsas)))
    print("Wrote {0}".format(output_csv))
    print("Wrote {0}".format(failures_csv))


if __name__ == "__main__":
    asyncio.run(main())