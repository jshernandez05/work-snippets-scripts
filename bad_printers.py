#!/usr/bin/python

import os
import re
import sys
import ldap
import subprocess
import socket
import ntcss_ldap
import ntcss_config

from collections import OrderedDict


def parse_printers_conf(file_path):
    """Parses printers.conf and returns a dictionary of printers with attributes."""
    printers = {}
    current_printer = [None]

    # Regular expressions
    printer_start_re = re.compile(r"<(DefaultPrinter|Printer) (\S+)>")
    key_value_re = re.compile(r"^\s*(\S+)\s+(.*)$")

    def start_new_printer(match):
        """Starts a new printer section."""
        printer_type, printer_name = match.groups()
        current_printer[0] = {"type": printer_type}
        printers[printer_name] = current_printer[0]

    def end_printer_section():
        """Ends the current printer section."""
        current_printer[0] = None

    def add_printer_attribute(match):
        """Adds key-value attributes to the current printer."""
        key, value = match.groups()
        current_printer[0][key] = value

    with open(file_path, "r") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue  # Skip empty lines and comments

            start_match = printer_start_re.match(line)
            end_match = re.match(r"</(DefaultPrinter|Printer)>", line)
            key_value_match = key_value_re.match(line)

            if start_match:
                start_new_printer(start_match)
            elif end_match and current_printer[0]:
                end_printer_section()
            elif key_value_match and current_printer[0] is not None:
                add_printer_attribute(key_value_match)

    return printers


def parse_output_files(prefix, config):
    """Parse output type and output_prt files dynamically."""
    output_printers = {}
    no_batch_flag = set()
    multi_output_printers = {}

    paths = config["paths"]

    applist = ["RSUPPLY", "OMMSNG", "RADM"] if prefix == "rsup" else ["NALCOMIS"]
    if config["nalc_enabled"] and config["ntcss_ver"] == "3.50":
        applist.append("NALCOMIS")

    if os.path.exists(paths.get(f"{prefix}_output_type", "")):
        output_printers, no_batch_flag = parse_output_type(
            paths[f"{prefix}_output_type"], applist
        )

    if os.path.exists(paths.get(f"{prefix}_output_prt", "")):
        multi_output_printers = parse_output_prt(
            paths[f"{prefix}_output_prt"], applist
        )

    return output_printers, no_batch_flag, multi_output_printers


def parse_output_type(file_path, applist):
    """Parse output_type file for printer name and output type."""
    output_printers = {}
    no_batch_flag = {}
    current_record = []

    with open(file_path, "r") as f:
        for line in f:
            line = line.strip()
            current_record.append(line)

            if len(current_record) == 6:
                app = current_record[1]
                if app in applist:
                    output_type = current_record[0]
                    printer = current_record[3] or "Blank"
                    output_printers.setdefault(printer, []).append(output_type)

                    batch_flag = current_record[4] != str(0)

                    if not batch_flag:
                        print(app, current_record[4], app in applist, batch_flag)
                        no_batch_flag.setdefault(output_type, []).append(app)

                # Reset after processing the data
                current_record = []

    return output_printers, no_batch_flag


def parse_output_prt(file_path, applist):
    """Parse output_prt file for printer name and output type."""
    printers = {}
    current_record = []

    with open(file_path, "r") as f:
        for line in f:
            line = line.strip()

            current_record.append(line)
            if len(current_record) == 5:
                output_type, app , printer = current_record[:3]
                if app in applist and output_type != "report":
                    printers.setdefault(output_type, {app: 0} )
                    printers[output_type][app] += 1
                current_record = []

    return remove_single_values(printers)


def remove_single_values(printers):
    """Filter dict to key only items where values length is > 1."""
    filtered_printers = {}
    for o, apps in printers.items():
        filtered = ["{0} ({1})".format(k, v) for k, v in apps.items() if v > 1]
        if filtered:
            filtered_printers[o] = filtered

    return filtered_printers


def extract_ip_from_uri(uri):
    """Extracts the IP address from a DeviceURI for comparison with LDAP."""
    ip_match = re.search(r"(\d+\.\d+\.\d+\.\d+)", uri)
    return ip_match[1] if ip_match else "Missing"


def parse_configurations(r_conf, r_conf_n, n_conf=None, n_conf_n=None):
    """Parses printer configurations from multiple sources."""
    return {
        'r_conf': (
            parse_printers_conf(r_conf) if os.path.exists(r_conf) else {}
        ),
        'r_conf_n': (
            parse_printers_conf(r_conf_n) if os.path.exists(r_conf_n) else {}
        ),
        'n_conf': (
            parse_printers_conf(n_conf)
            if n_conf is not None and os.path.exists(n_conf)
            else {}
        ),
        'n_conf_n': (
            parse_printers_conf(n_conf_n)
            if n_conf_n is not None and os.path.exists(n_conf_n)
            else {}
        ),
    }


def get_all_printer_names(printer_configs, r_output_printers, n_output_printers, ldap_printers):
    """Gets all unique printer names from all sources."""
    all_printer_names = set()
    for key in printer_configs:
        all_printer_names.update(printer_configs[key].keys())
    all_printer_names.update(r_output_printers)
    all_printer_names.update(ldap_printers.keys())
    all_printer_names.update(n_output_printers)
    return sorted(all_printer_names)


def extract_printer_data(printer, printer_configs):
    """Extracts URIs and IPs for a specific printer from all sources."""
    printer_data = {}
    for key in printer_configs:
        uri = printer_configs[key].get(printer, {}).get("DeviceURI", "Missing")
        ip = extract_ip_from_uri(uri)
        printer_data[key] = ip
    return printer_data


def append_printer_entry(results, printer, printer_data, r_output_type, n_output_type, ldap_ip, n_conf_exists):
    """Appends missing or mismatched printer information to the results list."""
    if n_conf_exists:
        results.append(
            (printer, printer_data['r_conf'], printer_data['r_conf_n'],
            printer_data['n_conf'], printer_data['n_conf_n'], r_output_type, n_output_type, ldap_ip)
        )
    else:
        results.append((printer, printer_data['r_conf'], printer_data['r_conf_n'], r_output_type, ldap_ip))


def check_missing_printers(printer_data, ldap_ip, n_conf_exists):
    """Checks if a printer is missing across sources."""

    if printer_data["r_conf"] == "Missing" and ((n_conf_exists and printer_data["n_conf"] == "Missing") or ldap_ip == "Missing"):
        return True

    for key in ["r_conf", "n_conf"]:
        value = printer_data.get(key)
        if value != "Missing" and IP_CACHE.get(value, "").startswith("*"):
            return True

    if ldap_ip != "Missing" and IP_CACHE.get(value, "").startswith("*"):
        return True

    return False

def check_mismatched_uris(printer_data, ldap_ip):
    """Checks if there are mismatched URIs."""
    if ldap_ip == "Missing":
        return False

    if printer_data['r_conf'] not in ["Missing", ldap_ip]:
        return True
    if printer_data['r_conf'] == "Missing" and printer_data['r_conf_n'] != "Missing" and printer_data['r_conf_n'] != ldap_ip:
        return True
    if printer_data['n_conf'] not in ["Missing", ldap_ip]:
        return True
    return (
        printer_data['n_conf'] == "Missing"
        and printer_data['n_conf_n'] != "Missing"
        and printer_data['n_conf_n'] != ldap_ip
    )


def track_duplicate_ips(ip_to_printer, ip, printer, r_output_name=None, n_output_name=None):
    """Tracks duplicate IPs for printers."""
    if ip and ip != "Missing":
        if ip not in ip_to_printer:
            ip_to_printer[ip] = {'printers': [], 'r_output_names': [], 'n_output_names': []}
        ip_to_printer[ip]['printers'].append(printer)
        if r_output_name:
            ip_to_printer[ip]['r_output_names'].append(r_output_name)
        if n_output_name:
            ip_to_printer[ip]['n_output_names'].append(n_output_name)


def identify_conf_duplicates(ip_to_printer, ldap_printers, conf_type='r'):
    """Identifies duplicate IPs."""
    return {
        ip: {
            "{0}_conf_printers".format(conf_type): data["printers"],
            "r_output_names": data["r_output_names"],
            "n_output_names": data["n_output_names"],
            "ldap_printers": [p for p, i in ldap_printers.items() if i == ip],
        }
        for ip, data in ip_to_printer.items()
        if len(data["printers"]) > 1
    }


IP_CACHE = {} # Global cache for validated IPs


def validate_ip(ip):
    """Check if IP is reachable, cache and return Green or Red text for printing"""
    if ip in IP_CACHE:
        return IP_CACHE[ip]

    if not is_reachable(ip, 9100) and not is_reachable(ip, 515):
        IP_CACHE[ip] = f"*{ip}"
    else:
        IP_CACHE[ip] = ip

    return IP_CACHE[ip]


def validate_all_ips(all_printer_names, printer_configs, ldap_printers):
    """Check availability of all printers"""
    validated_ips = {}
    printer_data = {}
    for printer in all_printer_names:
        if printer == "Blank":
            continue
        data = extract_printer_data(printer, printer_configs)
        printer_data[printer] = {
            v
            for v in data.values() + [ldap_printers.get(printer)]
            if v != "Missing" and v is not None
        }

    all_ips = {ip for ips in printer_data.values() for ip in ips}

    for ip in all_ips:
        validate_ip(ip)


def compare_conf_printers(
    config,
    r_output_printers,
    n_output_printers,
    ldap_printers,
    print_servers,
    ):
    """Compares multiple printers.conf files and finds missing printers, mismatched URIs, and duplicate IPs."""
    paths = config["paths"]
    r_conf = paths["rsup_cups"]
    r_conf_n = paths["rsup_cups_new"]
    n_conf = paths["nalc_cups"]
    n_conf_n = paths["nalc_cups_new"]

    printer_configs = parse_configurations(r_conf, r_conf_n, n_conf, n_conf_n)


    n_conf_exists = os.path.exists(n_conf) if n_conf else False
    all_printer_names = get_all_printer_names(printer_configs, r_output_printers, n_output_printers or [], ldap_printers)

    validate_all_ips(all_printer_names, printer_configs, ldap_printers)

    missing_printers = []
    mismatched_uris = []
    r_conf_ip_to_printer = {}
    n_conf_ip_to_printer = {}

    for printer in all_printer_names:
        printer_data = extract_printer_data(printer, printer_configs)
        r_output_type = printer in r_output_printers
        n_output_type = printer in n_output_printers if n_output_printers else False
        ldap_ip = ldap_printers.get(printer, "Missing")
        r_conf_ip = printer_data.get("r_conf", "Missing")
        n_conf_ip = printer_data.get("n_conf", "Missing")


        r_output_name = printer if r_output_type else None
        n_output_name = printer if n_output_type else None

        if r_conf_ip not in print_servers:
            # Track duplicate IPs in r.conf
            track_duplicate_ips(r_conf_ip_to_printer, r_conf_ip, printer, r_output_name, n_output_name)

        # Track duplicate IPs in n.conf
        if n_conf_exists and n_conf_ip not in print_servers:
            track_duplicate_ips(n_conf_ip_to_printer, n_conf_ip, printer, r_output_name, n_output_name)

        # Track missing printers
        if check_missing_printers(printer_data, ldap_ip, n_conf_exists) and printer != "Blank":
            append_printer_entry(missing_printers, printer, printer_data, r_output_type, n_output_type, ldap_ip, n_conf_exists)

        # Track mismatched URIs
        if ldap_ip != "Missing" and check_mismatched_uris(printer_data, ldap_ip):
            append_printer_entry(mismatched_uris, printer, printer_data, r_output_type, n_output_type, ldap_ip, n_conf_exists)

    # Identify duplicate IPs in r.conf
    r_conf_duplicates = identify_conf_duplicates(r_conf_ip_to_printer, ldap_printers)

    # Identify  duplicate IPs in n.conf if it exists
    n_conf_duplicates = {}
    if n_conf_exists:
        n_conf_duplicates = identify_conf_duplicates(n_conf_ip_to_printer, ldap_printers, "n")
    return missing_printers, mismatched_uris, r_conf_duplicates, n_conf_duplicates


def shell_command(command):
    """Run shell command and return output."""
    try:
        p = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=False)
        output, err = p.communicate()

        if p.returncode != 0:
            print("\n  Failed to run command {0}: {1}".format(" ".join(command), str(err).strip()))
            return None

    except OSError as e:
        print(" \n  Failed to run command: {0}".format(" ".join(command)))

    return output


def get_server_info():
    """Get server related details."""
    hostname = socket.gethostname()
    server = hostname.split(".")[0]

    version_cmd = ["rpm", "-q", "ntcss-systems-dap"]
    ntcss_ver = shell_command(version_cmd).split("-")[3].strip() or ""

    config_cmd = ["grep", "CF=", "/var/log/archmod/ntcss.env"]
    ntcss_config = shell_command(config_cmd).split("=")[-1].strip() or ""
    nalc_enabled = ntcss_config == "Force"

    return hostname, server, ntcss_ver, nalc_enabled


def is_reachable(host, port, timeout=0.07):
    """Identifies if an IP or FQDN is reachable"""
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(timeout)
    try:
        return connection_test(s, host, port)
    except Exception:
        try:
            return connection_test(s, host, port)
        except Exception:
            return False
    finally:
        s.close()


def connection_test(s, host, port):
    s.connect((host, int(port)))
    s.shutdown(socket.SHUT_RDWR)
    return True


def sftp_from_remote(server, remote, files):
    """Transfers .conf, .conf.N, output_type from rsupmast|nalc."""
    for path in files:
        basename = os.path.basename(path)
        cmd = ["/h/NTCSSS/bin/net_xfer", "get", remote, path, "/tmp/{0}_{1}".format(remote, basename)]
        try:
            p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=False)
            output, err = p.communicate()

            if p.returncode != 0:
                print("  WARNING: Failed to get {0} {1}: {2}".format(remote, basename, "File does not exist."))

        except OSError as e:
            print(" \n  Failed to run command: {0}".format(" ".join(cmd)))


def fetch_ldap_printers():
    """Fetch all pritners from LDAP Printers table."""
    bind_creds = ntcss_config.get_local_ldap_server_admin_credentials()
    ldap_utility = ntcss_ldap.connect_to_ldap_server("ldaps://rsupmast", bind_creds)
    ldap_conn = ldap_utility._connection

    ldap_results = ldap_conn.search_s(
            "ou=PRINTER_TABLE,o=optimized", ldap.SCOPE_SUBTREE, "(objectClass=cssPrinter)", ["printerName", "printerIP", "printerPort"]
    )
    ldap_conn.unbind_s()

    # Keep only the printer dicts remove the dn
    printer_dict_list = [d for _, d in ldap_results]

    # Filter out printservers because they will have duplicates
    allowed_ports = {"P1", "P2", "S1", "S2", "Missing"}

    ldap_printers = {}
    ip_to_printers = {}
    print_servers = []
    for printer in printer_dict_list:
        printer_port = set(printer.get("printerPort")) or "Missing"

        printer_ip = printer.get("printerIP", "Missing")[0]
        if not printer_port.issubset(allowed_ports):
            print_servers.append(printer_ip)
            printer_name = "printServer"
        printer_name = printer.get("printerName", "Missing")[0]
        ldap_printers[printer_name] = printer_ip
        ip_to_printers.setdefault(printer_ip, [])
        ip_to_printers[printer_ip].append(printer_name)


    return ldap_printers, ip_to_printers, set(print_servers)


def find_duplicate_ldap_ips(ldap_ips, print_servers, rsup_printers, nalc_printers=None):
    """Format and filter printers with duplicate IPs in LDAP."""
    duplicates = {}

    for ip, names in ldap_ips.items():
        if ip in print_servers:
            continue
        if len(names) > 1:
            duplicates[ip] = {
                "names": names,
                "r_output_type": [],
                "n_output_type": [] if nalc_printers else None
            }

            for name in names:
                if name in rsup_printers:
                    duplicates[ip]["r_output_type"].append(name)
                if nalc_printers and name in nalc_printers:
                    duplicates[ip]["n_output_type"].append(name)

    return duplicates


def sort_rows_by_ip(rows):
    """Sorts rows numerically based on the IP address in the first element."""
    def ip_key(ip):
        """Converts an IP address into a tuple of integers for proper sorting."""
        return tuple(int(part) for part in ip.split('.'))

    return sorted(rows, key=lambda x: ip_key(x[0]))


def format_missing_printers(title, missing_printers, ntcss_ver, nalc_enabled):
    """Sort rows by printer name and validate ip addresses."""
    if not missing_printers:
        return []

    sorted_printers = sorted(missing_printers)
    ip_cols = {0, 5, 6} if len(sorted_printers[0]) > 5 else {0, 3}
    for i, row in enumerate(sorted_printers):
        sorted_printers[i] = [
            validate_ip(col) if idx not in ip_cols and col != "Missing" else col
            for idx, col in enumerate(row)
        ]

    if nalc_enabled and ntcss_ver != "3.50":
        fields = [
                "Printer", "r.conf", "r.conf.N", "n.conf", "n.conf.N", "r_output", "n_output", "LDAP"
        ]
    else:
        fields = ["Printer", "r.conf", "r.conf.N", "r_output", "LDAP"]

    return format_table_output(title, fields, sorted_printers, ip_cols=True)


def combine_app_dicts(r_dict, n_dict=None):
    """Combine multi_prt dicts into single dict."""
    combined_dict = {}

    if not r_dict and not n_dict:
        return combined_dict

    for k, v in r_dict.items():
        combined_dict.setdefault(k, {})
        combined_dict[k]["rsup"] = set(v)

    if n_dict:
        for k, v in n_dict.items():
            combined_dict.setdefault(k, {})
            combined_dict[k]["nalc"] = set(v)

    return combined_dict

def print_table(table):
    for line in table:
        print(line)

def print_append(table, output):
    """Prints formatted table to screen."""
    for line in table:
        print(line)
    output.append(table)


def write_report(output):
    """Prints output in formatted table."""
    for table in output:
        for line in table:
            print(line)


def format_table_output(title, headers, rows, ip_cols=False, output_type_text=False):
    """Formats table data into list for display and writing to file."""
    output = ["\n  " + title]

    header_len = len(headers)
    col_width = [max(len(str(row[i])) for row in rows + [headers]) for i in range(header_len)]
    header_row = " | ".join(str(headers[i]).ljust(col_width[i]) for i in range(header_len))
    border_width = max(len(header_row), len(title))
    output.extend(("  " + "=" * border_width, f"  {header_row}"))
    output.append("  " + "-" * border_width)

    if not rows:
        output.append("  No Records...\n")
        return output

    output.extend(
        "  "
        + " | ".join(
            str(row[i]).ljust(col_width[i]) for i in range(header_len)
        )
        for row in rows
    )
    output.append("  " + "=" * border_width)

    if ip_cols:
        output.append("  * - IPs that were not available during ping test")
    if output_type_text:
        output.append("  Note - output_type columns list printers in output_type file that match the .conf printer name.")

    output.append("")

    return output


def format_ldap_duplicate_printers(duplicates, nalc_outputs, ntcss_ver):
    """Prints the LDAP duplicate ips table using print_table function."""
    rows = []
    fields =  ["IP Address", "Printer Names", "RSUP Output Types"]
    for ip, data in duplicates.items():
        row = [ip, ", ".join(data["names"]), ", ".join(data.get("r_output_type", []))]
        if nalc_outputs and "n_output_type" in data.keys():
            row.append(", ".join(data.get("n_output_type", []) or []))
        rows.append(row)

    if nalc_outputs and ntcss_ver != "3.50":
        fields = ["IP Address", "Printer Names", "RSUP Output Types", "NALC Output Types"]

    sorted_rows = sort_rows_by_ip(rows)
    sorted_rows = [[validate_ip(row[0])] + row[1:] for row in sorted_rows]
    return format_table_output(
        "Duplicate LDAP Printers", fields, sorted_rows, ip_cols=True
    )


def remove_nalc_keys(duplicates):
    """Remove nalc keys for unit level configs."""
    for k, v in duplicates.items():
        del v["n_output_names"]


def format_conf_duplicate_printers(header, duplicates, nalc_enabled, ntcss_ver, conf_type="r"):
    """Print the .conf duplicate ips table using print_table function"""
    rows = []

    if not nalc_enabled or ntcss_ver == "3.50":
        fields = ["IP Address", "r.conf Printers", "RSUP output_type", "LDAP Printers"]
        remove_nalc_keys(duplicates)
    elif conf_type == "n":
        fields =  ["IP Address", "n.conf Printers", "RSUP output_type", "NALC output_type", "LDAP Printers"]
    else:
        fields = ["IP Address", "r.conf Printers", "RSUP output_type", "NALC output_type", "LDAP Printers"]

    for ip, data in duplicates.items():
        ldap_names = ", ".join(data.get("ldap_printers", []))
        r_conf_names = ", ".join(data.get("r_conf_printers", []))
        r_output_names = ", ".join(data.get("r_output_names", []))
        row = [ip, r_conf_names, r_output_names]
        if "n_output_names" in data.keys():
            row.append(", ".join(data.get("n_output_names", []) or []))

        if "n_conf_printers" in data.keys():
            row.pop(1)
            row.insert(1, ", ".join(data.get("n_conf_printers", []) or []))

        row.append(ldap_names)
        rows.append(row)

    sorted_rows = sort_rows_by_ip(rows)
    sorted_rows = [[validate_ip(row[0])] + row[1:] for row in sorted_rows]
    return format_table_output(header, fields, sorted_rows, True, True)


def format_output_type_table(header, records, nalc_enabled, ntcss_ver):
    """Print output types from output_prt files that have multiple printers."""
    rows = []
    fields = ["Output Type", "Applications"]

    for output_type, apps in records.items():
        rsup_printers = apps.get("rsup", set())
        row = [output_type, ", ".join(rsup_printers)]
        if nalc_enabled and ntcss_ver != "3.50":
            nalc_printers = apps.get("nalc", set())
            row = [output_type, ", ".join(rsup_printers | nalc_printers)]

        rows.append(row)

    rows = sorted(rows)
    return format_table_output(header, fields, rows)


def format_report(
    missing_printers,
    mismatched_uris,
    ldap_duplicates,
    r_conf_duplicates,
    n_conf_duplicates,
    no_batch_flag,
    multi_output_printers,
    nalc_enabled,
    ntcss_ver
    ):
    """Format tables into report for output."""
    output = []
    title = ["\n", "Bad Printer Report".center(110), "====================".center(110)]
    print_append(title, output)

    formatted_printers_table = format_missing_printers("Printers Missing in Cups or LDAP; or Bad IP Ping Test", missing_printers, ntcss_ver,
            nalc_enabled
    )
    print_append(formatted_printers_table, output)

    formatted_uris_table = format_missing_printers("Cups to LDAP IP Mismatches", mismatched_uris, ntcss_ver, nalc_enabled)
    print_append(formatted_uris_table, output)

    formatted_ldap_table = format_ldap_duplicate_printers(ldap_duplicates, nalc_enabled, ntcss_ver)
    print_append(formatted_ldap_table, output)

    formatted_r_conf_duplicates = format_conf_duplicate_printers("Duplicate RSUP printers.conf IPs", r_conf_duplicates,
            nalc_enabled, ntcss_ver)
    print_append(formatted_r_conf_duplicates, output)

    if nalc_enabled and ntcss_ver != "3.50":
        formatted_n_conf_duplicates = format_conf_duplicate_printers(
            "Duplicate NALC printers.conf IPs", n_conf_duplicates, nalc_enabled, ntcss_ver, "n"
        )
        print_append(formatted_n_conf_duplicates, output)

    formatted_output_table = format_output_type_table(
        "Batch Print Flag Unset", no_batch_flag, nalc_enabled, ntcss_ver
    )
    print_append(formatted_output_table, output)

    formatted_multi_printers = format_output_type_table(
        "Output Types with Multiple Printers", multi_output_printers, nalc_enabled, ntcss_ver
    )
    print_append(formatted_multi_printers, output)

    return output


def initialize_paths(server, nalc_enabled, ntcss_ver):
    """Returns file paths based on server name"""
    server_path_map = OrderedDict()

    rsup_map = OrderedDict([
        ("rsup_cups_new", "/etc/cups/printers.conf.N"),
        ("rsup_cups", "/etc/cups/printers.conf"),
        ("rsup_output_type", "/h/NTCSSS/database/output_type"),
        ("rsup_output_prt", "/h/NTCSSS/database/output_prt"),
        ("nalc_cups_new", "/tmp/nalc_printers.conf.N" if nalc_enabled and ntcss_ver != "3.50" else None),
        ("nalc_cups", "/tmp/nalc_printers.conf" if nalc_enabled and ntcss_ver != "3.50" else None),
        ("nalc_output_type", "/tmp/nalc_output_type" if nalc_enabled and ntcss_ver != "3.50" else None),
        ("nalc_output_prt", "/tmp/nalc_output_prt" if nalc_enabled and ntcss_ver != "3.50" else None),
    ])

    nalc_map = OrderedDict([
        ("nalc_cups_new", "/etc/cups/printers.conf.N"),
        ("nalc_cups", "/etc/cups/printers.conf"),
        ("nalc_output_type", "/h/NTCSSS/database/output_type"),
        ("nalc_output_type", "/h/NTCSSS/database/output_prt"),
        ("rsup_cups_new", "/tmp/rsupmast_printers.conf.N"),
        ("rsup_cups", "/tmp/rsupmast_printers.conf"),
        ("rsup_output_type", "/tmp/rsupmast_output_type"),
        ("rsup_output_prt", "/tmp/rsupmast_output_prt"),
    ])

    server_path_map["rsupmast"] = rsup_map
    server_path_map["nalc"] = nalc_map

    return server_path_map.get(server, server_path_map["rsupmast"])


def main():
    hostname, server, ntcss_ver, nalc_enabled = get_server_info()
    remote = "nalc" if server == "rsupmast" else "rsupmast"

    # Get file paths based on server
    paths = initialize_paths(server, nalc_enabled, ntcss_ver)

    # Common config
    config = {
        "ntcss_ver": ntcss_ver,
        "nalc_enabled": nalc_enabled,
        "paths": paths
    }

    # Initialize nalc variables
    nalc_output_printers, nalc_no_batch_flag, nalc_multi_output_printers = {}, set(), {}

    # Fetch LDAP Printers
    ldap_printers, ldap_ips, print_servers = fetch_ldap_printers()

    # Parse the output printers for r_conf
    rsup_output_printers, rsup_no_batch_flag, rsup_multi_output_printers = parse_output_files(
        "rsup", config
    )


    if nalc_enabled:
        if ntcss_ver != "3.50":
            sftp_from_remote(server, remote, paths.values()[:4])

            nalc_output_printers, nalc_no_batch_flag, nalc_multi_output_printers = parse_output_files(
                "nalc", config
            )

    missing_printers, mismatched_uris, r_conf_duplicates, n_conf_duplicates = compare_conf_printers(
        config, set(rsup_output_printers.keys()),  set(nalc_output_printers.keys()),
        ldap_printers, print_servers,
    )

    ldap_duplicates = find_duplicate_ldap_ips(
        ldap_ips, print_servers, set(rsup_output_printers.keys()), set(nalc_output_printers.keys())
    )

    no_batch_flag = combine_app_dicts(rsup_no_batch_flag, nalc_no_batch_flag) or {}
    multi_output_printers = combine_app_dicts(rsup_multi_output_printers, nalc_multi_output_printers) or {}

    formatted_report = format_report(
        missing_printers,
        mismatched_uris,
        ldap_duplicates,
        r_conf_duplicates,
        n_conf_duplicates,
        no_batch_flag,
        multi_output_printers,
        nalc_enabled,
        ntcss_ver,
    )


if __name__ == "__main__":
    if len(sys.argv) > 1:
        if sys.argv[1] not in ["-v", "version"]:
            print("\nInvalid arguments.")
            print("Usage: bad_printers.py [-v | version]\n")

        else:
            print("\nbad_printers 1.1.0\n")

        sys.exit(0)

    main()

