#!/usr/bin/env python3
import csv
import json
import re
import ssl
from dataclasses import dataclass
from pathlib import Path
from typing import Any
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen


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


def fetch_text(url: str, timeout: int = 20) -> tuple[str, int]:
    req = Request(
        url,
        headers={"User-Agent": "RHSA-CVE-Collector/1.0"},
    )
    context = ssl.create_default_context()

    with urlopen(req, timeout=timeout, context=context) as response:
        charset = response.headers.get_content_charset() or "utf-8"
        text = response.read().decode(charset, errors="replace")
        status_code = getattr(response, "status", 200)
        return text, status_code


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


def try_json_source(rhsa: str, url: str, source_name: str) -> dict[str, Any]:
    try:
        raw, status_code = fetch_text(url)
        payload = json.loads(raw)
        cves = extract_cves_from_json(payload)

        if cves:
            return build_result(
                rhsa=rhsa,
                source=source_name,
                url=url,
                cves=cves,
                status_code=status_code,
                error_detail="",
            )

        return build_result(
            rhsa=rhsa,
            source=source_name + "_empty",
            url=url,
            cves=[],
            status_code=status_code,
            error_detail="No CVEs found in JSON payload",
        )
    except HTTPError as exc:
        return build_result(
            rhsa=rhsa,
            source=source_name + "_error",
            url=url,
            cves=[],
            status_code=exc.code,
            error_detail=repr(exc),
        )
    except (URLError, ValueError, json.JSONDecodeError) as exc:
        return build_result(
            rhsa=rhsa,
            source=source_name + "_error",
            url=url,
            cves=[],
            status_code="",
            error_detail=repr(exc),
        )


def try_html_source(rhsa: str, url: str) -> dict[str, Any]:
    try:
        html, status_code = fetch_text(url)
        cves = extract_cves_from_text(html)

        if cves:
            return build_result(
                rhsa=rhsa,
                source="html_text",
                url=url,
                cves=cves,
                status_code=status_code,
                error_detail="",
            )

        return build_result(
            rhsa=rhsa,
            source="html_empty",
            url=url,
            cves=[],
            status_code=status_code,
            error_detail="No CVEs found in HTML response",
        )
    except HTTPError as exc:
        return build_result(
            rhsa=rhsa,
            source="html_error",
            url=url,
            cves=[],
            status_code=exc.code,
            error_detail=repr(exc),
        )
    except URLError as exc:
        return build_result(
            rhsa=rhsa,
            source="html_error",
            url=url,
            cves=[],
            status_code="",
            error_detail=repr(exc),
        )


def fetch_cves_for_rhsa(rhsa: str) -> dict[str, Any]:
    rhsa = rhsa.upper().strip()

    csaf_url = CSAF_URL.format(rhsa=rhsa)
    csaf_result = try_json_source(rhsa, csaf_url, "csaf_json")
    if csaf_result["cves"]:
        return csaf_result

    cvrf_url = CVRF_URL.format(rhsa=rhsa)
    cvrf_result = try_json_source(rhsa, cvrf_url, "cvrf_json")
    if cvrf_result["cves"]:
        return cvrf_result

    errata_url = ERRATA_URL.format(rhsa=rhsa)
    html_result = try_html_source(rhsa, errata_url)
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


def build_rhsa_map(
    findings: list[Finding],
    output_csv: Path,
    failures_csv: Path,
) -> None:
    pairs = unique_rhsa_package_pairs(findings)
    rhsas = sorted({rhsa for rhsa, _ in pairs})

    rhsa_cache: dict[str, dict[str, Any]] = {}

    for rhsa in rhsas:
        print("Fetching {0}".format(rhsa))
        rhsa_cache[rhsa] = fetch_cves_for_rhsa(rhsa)

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


def main() -> None:
    input_csv = Path("rhsa_ni.csv")
    output_csv = Path("rhsa_cve_map2.csv")
    failures_csv = Path("rhsa_scrape_failures2.csv")

    findings = parse_acas(input_csv)

    if not findings:
        print("No RHSA findings found in {0}".format(input_csv))
        return

    build_rhsa_map(
        findings=findings,
        output_csv=output_csv,
        failures_csv=failures_csv,
    )

    unique_pairs = unique_rhsa_package_pairs(findings)
    unique_rhsas = sorted({rhsa for rhsa, _ in unique_pairs})

    print("Parsed {0} findings".format(len(findings)))
    print("Found {0} unique RHSA/package pairs".format(len(unique_pairs)))
    print("Fetched {0} unique RHSAs".format(len(unique_rhsas)))
    print("Wrote {0}".format(output_csv))
    print("Wrote {0}".format(failures_csv))


if __name__ == "__main__":
    main()