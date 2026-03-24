#!/usr/bin/env python3
import csv
import re
import subprocess
from pathlib import Path
from typing import Dict, Set, Tuple, Optional, List


CVE_PATTERN = re.compile(r"CVE-\d{4}-\d+", re.IGNORECASE)
RHSA_PATTERN = re.compile(r"RHSA-\d{4}:\d+", re.IGNORECASE)


class Finding(object):
    def __init__(self, host, plugin_id, package, rhsa, severity):
        self.host = host
        self.plugin_id = plugin_id
        self.package = package
        self.rhsa = rhsa
        self.severity = severity


def load_rhsa_map(path):
    """
    Returns:
        mapping: Dict[(rhsa, package), Set[cve]]
        source_map: Dict[(rhsa, package), str]
        url_map: Dict[(rhsa, package), str]
    """
    mapping = {}
    source_map = {}
    url_map = {}

    with path.open("r") as f:
        reader = csv.DictReader(f)
        for row in reader:
            rhsa = row.get("rhsa", "").strip().upper()
            package = row.get("package", "").strip()
            cve = row.get("cve", "").strip().upper()
            source = row.get("source", "").strip()
            url = row.get("url", "").strip()

            if not rhsa or not package:
                continue

            key = (rhsa, package)

            if key not in mapping:
                mapping[key] = set()

            # only add real CVEs
            if cve:
                mapping[key].add(cve)

            source_map[key] = source
            url_map[key] = url

    return mapping, source_map, url_map


def extract_cves(text):
    matches = CVE_PATTERN.findall(text)
    return set([m.upper() for m in matches])


def rpm_changelog(pkg):
    result = subprocess.run(
        ["rpm", "-q", "--changelog", pkg],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        universal_newlines=True
    )
    return result.stdout


def rpm_installed(pkg):
    result = subprocess.run(
        ["rpm", "-q", pkg],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        universal_newlines=True
    )
    if result.returncode != 0:
        return None
    return result.stdout.strip()


def normalize_package_name(package):
    return package.strip()


def find_expected_cves(finding, mapping, source_map, url_map):
    """
    Exact match first on (rhsa, package).
    If not found, try matching rows where the package field contains multiple packages.
    """
    exact_key = (finding.rhsa.upper(), finding.package)
    if exact_key in mapping or exact_key in source_map:
        return (
            mapping.get(exact_key, set()),
            source_map.get(exact_key, ""),
            url_map.get(exact_key, "")
        )

    # fallback for rows like:
    # "grub2, mokutil, shim, and shim-unsigned-x64"
    for key in source_map:
        rhsa, package_field = key
        if rhsa != finding.rhsa.upper():
            continue

        package_text = package_field.replace(" and ", ", ")
        package_parts = [p.strip() for p in package_text.split(",") if p.strip()]

        if finding.package in package_parts:
            return (
                mapping.get(key, set()),
                source_map.get(key, ""),
                url_map.get(key, "")
            )

    return set(), "", ""


def validate(finding, mapping, source_map, url_map):
    installed = rpm_installed(finding.package)

    if not installed:
        return (
            "PACKAGE_NOT_INSTALLED",
            "",
            "",
            "",
            "",
            ""
        )

    expected, ref_source, ref_url = find_expected_cves(
        finding, mapping, source_map, url_map
    )

    if not ref_source:
        return (
            "REFERENCE_MISSING",
            installed,
            "",
            "",
            "",
            ""
        )

    if ref_source == "error" and len(expected) == 0:
        return (
            "SCRAPER_ERROR",
            installed,
            "",
            "",
            ref_source,
            ref_url
        )

    changelog_text = rpm_changelog(finding.package)
    observed = extract_cves(changelog_text)
    missing = expected - observed

    if len(expected) == 0:
        return (
            "NO_CVES_IN_REFERENCE",
            installed,
            "",
            "",
            ref_source,
            ref_url
        )

    if len(missing) == 0:
        return (
            "VALIDATED_FIXED",
            installed,
            ",".join(sorted(expected)),
            "",
            ref_source,
            ref_url
        )

    if len(observed.intersection(expected)) > 0:
        return (
            "PARTIAL",
            installed,
            ",".join(sorted(expected)),
            ",".join(sorted(missing)),
            ref_source,
            ref_url
        )

    return (
        "NO_MATCH",
        installed,
        ",".join(sorted(expected)),
        ",".join(sorted(missing)),
        ref_source,
        ref_url
    )


def parse_acas(csv_path):
    findings = []

    with csv_path.open("r") as f:
        reader = csv.DictReader(f)

        for row in reader:
            # supports either export style
            name = row.get("Name", "") or row.get("Script Name", "")
            plugin_id = row.get("Plugin ID", "") or row.get("Plugin", "")
            severity = row.get("Severity", "")
            host = row.get("Host", "")

            name = name.strip()
            plugin_id = plugin_id.strip()
            severity = severity.strip()
            host = host.strip()

            rhsa_match = RHSA_PATTERN.search(name)
            if not rhsa_match:
                continue

            rhsa = rhsa_match.group(0).upper()

            try:
                package = name.split(":", 1)[1].split("(", 1)[0].strip()
            except Exception:
                continue

            findings.append(
                Finding(
                    host=host,
                    plugin_id=plugin_id,
                    package=normalize_package_name(package),
                    rhsa=rhsa,
                    severity=severity,
                )
            )

    return findings


def main():
    rhsa_map, source_map, url_map = load_rhsa_map(Path("rhsa_cve_map.csv"))
    findings = parse_acas(Path("acas_export.csv"))

    with open("validation_report.csv", "w") as f:
        writer = csv.writer(f)

        writer.writerow([
            "host",
            "plugin",
            "package",
            "rhsa",
            "severity",
            "installed",
            "status",
            "expected_cves",
            "missing_cves",
            "reference_source",
            "reference_url",
        ])

        for finding in findings:
            status, installed, expected, missing, ref_source, ref_url = validate(
                finding, rhsa_map, source_map, url_map
            )

            writer.writerow([
                finding.host,
                finding.plugin_id,
                finding.package,
                finding.rhsa,
                finding.severity,
                installed,
                status,
                expected,
                missing,
                ref_source,
                ref_url,
            ])


if __name__ == "__main__":
    main()