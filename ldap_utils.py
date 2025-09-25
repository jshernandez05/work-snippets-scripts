#!/usr/bin/python

import pexpect
import os
import re
import sys
import ldap
import subprocess
import ntcss_ldap
import ntcss_config
from abc import ABCMeta, abstractmethod
from collections import OrderedDict
from time import sleep

import argparse


class LDAPShellService:
    """
    A service to securely execute LDAP-related shell scripts.
    """

    def __init__(self, script_base_path="/h/USERS/rheend-admin/ldap_utils"):
        """
        Initializes the LDAP shell service.

        Args:
            script_base_path (str): Base path where LDAP shell scripts are stored.
        """
        self.script_base_path = script_base_path

    @staticmethod
    def run_command(command, *args):
        """
        Securely executes a shell command with provided arguments.

        Args:
            command (str): The schell command to execute.
            *args: Additional arguments for the command.

        Returns:
            tuple: (success: bool, output: str)
        """
        cmd = [command] + list(args)

        try:
            process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=False)
            output, error = process.communicate()

            if process.returncode != 0:
                print("\n  Command failed:", error.strip())
                return False, error.strip()

            return True, output.strip()

        except OSError as e:
            print("\n  Failed to run command:", str(e))
            return False, str(e)

    def _run_interactive_script(self, script_name, prompts, *args):
        """
        Securely executes an interactive shell script with dynamic input handling.

        Args:
            script_name (str): The name of the shell script to execute.
            prompts (dict): A mapping of expected exact prompts to valid responses.
            *args: Arguments to pass to the script.

        Returns:
            str: The output of the executed script.
        """
        command = [script_name] + list(args)
        command_str = " ".join(command)  # Convert list to string for execution

        try:
            # Spawn the interactive process
            child = pexpect.spawn(command_str, timeout=540)
            child.setecho(False)
            # Log execution
            print("\nExecuting: {0}\n".format(command_str))

            # Capture script output dynamically
            output_lines = []

            prompt_count = 0
            max_manual_prompts = 3

            while True:
                index = child.expect_exact(list(prompts.keys()) + [pexpect.EOF], timeout=300)

                # Capture everything printed before the prompt
                if child.before:
                    output = child.before.strip()
                    if output:
                        print("\n" + output + "\n")
                        output_lines.append(output)  # Store for return
                # Handle script completion
                if index == len(prompts):  # pexpect.EOF
                    break

                # Get the expected prompt
                expected_prompt = list(prompts.keys())[index]
                valid_responses = prompts[expected_prompt]

                if prompt_count < max_manual_prompts:
                    while True:
                        user_input = raw_input(expected_prompt + " ").strip().lower()
                        if user_input in valid_responses or ("" in valid_responses and user_input == ""):
                            break
                        print("Invalid input. Expected: {0}".format(", ".join(valid_responses) or "Enter key"))
                else:
                    print(expected_prompt + "\n")
                    user_input = ""
                # Send response (empty string for Enter key)
                child.sendline(user_input)
                prompt_count += 1

            return "\n".join(output_lines)

        except pexpect.ExceptionPexpect as e:
            return "Error executing {0}: {1}".format(script_name, str(e))

    def _get_backup_files(self, directory=None):
        """
        Fetches a list of valid filenames that start with "ntcss_db-" in the given directory.

        Args:
            directory (str): The path to search for files.

        Returns:
            list: A list of filenames that match the criteria.
        """
        try:
            files = sorted([f for f in os.listdir(directory) if f.startswith("ntcss_db-")])
            if not files:
                print("No matching files found in {0}".format(directory))

            return files + [""], files[-1]
        except OSError as e:
            print("Error accessing directory {0}: {1}".format(directory, str(e)))
            return [""], None


    def backup_ldap(self):
        """Executes the LDAP backup script."""
        status, output = self.run_command("/h/NTCSSS/ldap/runtime/makeLdifBackup.sh")
        if status:
            print(output)
        return status

    def restore_ldap(self, backup_file=None):
        """Executes the LDAP restore script."""

        backup_dir = "/h/NTCSSS/ldap/runtime/db_backup"
        valid_files, latest = self._get_backup_files(backup_dir)
        if not (valid_files or latest):
            return("Error finding backup files in {0}: {1}, {2}".format(backup_dir, valid_files, latest))

        prompts = OrderedDict({
            "Please enter full path to LDIF backup Directory: [{0}] ".format(backup_dir): ["", backup_dir],
            "Enter name of Backup file for LDAP recovery: [{0}] ".format(latest): valid_files,
            "Enter Y to continue or N to exit: [Y/N] ": ["y", "Y", "Yes", "YES", "yes", "N", "n", "no"],
            "PLEASE BE PATIENT...THIS MAY TAKE A FEW MINUTES": "",
            "Starting up LDAP to update the contents of the BDB": "",
            "Decrypting Compressed LDAP LDIF File ...": "",
            "Uncompressing LDAP LDIF File ...": "",
            "Adding data to Directory Server...": "",
            "... LDAP/database restore complete ...": "",
        })
        return self._run_interactive_script("/h/NTCSSS/ldap/runtime/makeLdifRestore.sh", prompts)

    def test_ldap(self):
        status, output = self.run_command("/h/NTCSSS/ldap/runtime/isLdapUp.sh")
        if status:
            print(output)
        return status

    def test_ldap_repl(self):
        status, output = self.run_command("/h/NTCSSS/ldap/runtime/test-replication.sh")
        if status:
            print(output)
        return status

class BaseDN:
    """
    Simulates a string enum for base DN values
    """
    auth = "ou=AUTH_TABLE,o=optimized"
    appusr = "ou=APPUSER_TABLE,o=optimized"
    adptr = "ou=ADAPTER_TABLE,o=optimized"
    adptyp = "ou=ADAPTER_TYPE_TABLE,o=optimized"
    group = "ou=Groups,o=optimized"
    host = "ou=HOSTS_TABLE,o=optimized"
    rdn = "cn=admin,o=optimized"
    people = "ou=People,o=optimized"
    prntr = "ou=PRINTER_TABLE,o=optimized"
    suffix = "o=optimized"
    sysconf = "ou=SYSCONF_TABLE,o=optimized"
    webusr = "ou=NTCSS_WEB_ACCESS,o=optimized"


class LDAPConnectionManager:
    """
    Establishes and manages connections to the LDAP server.

    Args:
        ldap_url (str): The LDAP server URL.
        bind_dn (str): The distinguished name (DN) to bind to the LDAP server.
        password (str): The password for the bind DN.

    Attributes:
        connection: The established LDAP connection.
    """

    def __init__(self, ldap_url=None, bind_dn=None, bind_password=None):
        """
        Initializes the LDAPHelper and sets up the connection.

        Args:
            ldap_url (str): The LDAP server URL.
            bind_dn (str, optional): The distinguished name (DN) to bind to the LDAP server.
            bind_password (str, optional): The password for the bind DN.

        Raises:
            Exception: If the connection or binding fails.
        """
        self.ldap_url = ldap_url
        # If bind user is specified, store credentials
        self._bind_credentials = [bind_dn, bind_password] if bind_dn else None
        self.ldap_utility = None

    def _create_connection(self):
        """
        Create and return an LDAPUtility object.

        Returns:
            ldap.Connection: A newly established LDAPUtility object.

        Raises:
            Exception: If the connection or binding fails.
        """
        # Check if credentials have been provided
        if not self._bind_credentials:
            self._bind_credentials = ntcss_config.get_local_ldap_server_admin_credentials()

        try:
            return ntcss_ldap.connect_to_ldap_server(
                self.ldap_url, self._bind_credentials
            )
        except Exception as e:
            raise Exception("Failed to connect to LDAP: {0}".format(e))

    def with_connection(self, func, *args, **kwargs):
        """
        Provided a conneciton to a given function,
        ensuring the connection is closed after use.

        Args:
            func (callable): A functin that requires and LDAP connection.
            *args: Positional arguments to the function.
            **kwargs: Keyword arguments to the function.

        Returns:
            Any: The return value of the function.

        Raises:
            Exception: If an error occurs during connection use.
        """
        bind_method = kwargs.pop("bind_method", "anonymous")
        try:
            self.ldap_utility = self._create_connection()
            ldap_connection = self.ldap_utility._connection

            if bind_method == "user":
                ldap_connection.simple_bind_s(*self._bind_credentials)
        
            return func(ldap_connection, *args)

        finally:
            if self.ldap_utility:
                try:
                    self.ldap_utility._connection.unbind_s()
                except ldap.LDAPError as e:
                    print("Failed to close LDAP connection: {0}".format(e))
                finally:
                    self.ldap_utility = None

    def _close_connection(self):
        """
        Close the LDAP connection.
        """
        if self.ldap_utility:
            try:
                print("\n  Closing LDAP connection")
                self.ldap_utility._connection.unbind_s()
            except Exception as e:
                print("\n  WARNING: Failed to close LDAP connection: {0}".format(e))
            finally:
                self.ldap_utility = None

    def exit_program(self):
        """
        Exit the program gracefully.

        Returns:
            None
        """
        self._close_connection()
        print("\n  Exiting...\n")
        sys.exit(0)


FETCH_CONFIG = {
    "user_details": {
        "base_dn": BaseDN.suffix,
        "filter_template": "(&(objectClass=top)(|(userLogin={0})(uid={0})))",
        "default_attrs": None,
        "filter_attrs": None,
    },
    "appusr_details": {
        "base_dn": BaseDN.appusr,
        "filter_template": "(&(userLogin={0})(cssApplicationName={1}))",
        "default_attrs": None,
        "filter_attrs": None,
    },
    "appusr_regstr": {
        "base_dn": BaseDN.appusr,
        "filter_template": "(&(userLogin={0})(cssApplicationName={1}))",
        "default_attrs": ["cssApplicationName", "cssAppRegistered", "userLogin"],
        "filter_attrs": ["cssApplicationName", "cssAppRegistered", "userLogin"],
    },
    "user_groups": {
        "base_dn": BaseDN.group,
        "filter_template": "(memberUid={0})",
        "default_attrs": None,
        "filter_attrs": ["cn"],
    },
    "user_registration": {
        "base_dn": BaseDN.appusr,
        "filter_template": "(&(!(cssApplicationName=NTCSS))(userLogin={0}))",
        "default_attrs": ["cssApplicationName", "cssAppRegistered", "userLogin"],
        "filter_attrs": None,
    },
    "app_admin_logins": {
        "base_dn": BaseDN.appusr,
        "filter_function": lambda: "(|{0})".format(
            "".join("({0}={1})".format("cssAppRole", role) for role in [4, 12, 20, 28])
        ),
        "conditions": [
            "(&(!({0}=NTCSS)){1})".format("cssApplicationName", "{filter}"),
            "(&({0}=NTCSS)(!(userLogin=ntcssii)))".format("cssApplicationName"),
        ],
        "default_attrs": ["userLogin", "cssApplicationName"],
        "filter_attrs": None,
    },
    "app_admin_details": {
        "base_dn": BaseDN.auth,
        "filter_template": "(userLogin={0})",
        "default_attrs": None,
        "filter_attrs": ["ntcssUserName", "principalName", "emailAddr", "ntcssUserPhone"],
    },
    "web_users_report": {
        "base_dn": BaseDN.webusr,
        "default_filter": "(objectClass=person)",
        "filter_template": None,
        "default_attrs": None,
        "filter_attrs": None,
    },
    "printer_details": {
        "base_dn": BaseDN.prntr,
        "defualt_filter": "(objectClass=cssPrinter)",
        "filter_template": "(|(printerIP={0})(printerName={0}))",
        "default_attrs": ["printerName", "printerIP", "printerLocation"],
        "filter_attrs": None,
    },
    "duplicate_printers": {
        "base_dn": BaseDN.prntr,
        "default_filter": "(printerIP=*)",
        "filter_attrs": ["printerName", "printerIP"],
        "default_attrs": ["printerName", "printerIP"],
    },
    "adapter_details": {
        "base_dn": BaseDN.adptr,
        "filter_template": "(adapterIP={0})",
        "default_attrs": ["adapterIP", "adapterFQDN", "adapterType"],
        "filter_attrs": None,
    },
    "adapter_type": {
        "base_dn": BaseDN.adptyp,
        "default_filter": "(objectClass=adapterType)",
        "filter_template": "(adapterType={0})",
        "default_attrs": ["adapterType", "adapterPort", "adapterConfigScript"],
        "filter_attrs": None,
    },
    "group_counts": {
        "base_dn": BaseDN.group,
        "filter_template": "(|(gidNumber={0})(cn={0}))",
        "default_attrs": ["cn", "gidNumber", "memberUid"],
        "filter_attrs": None,
    },
    "host_details": {
        "base_dn": BaseDN.host,
        "filter_template": "(|(cssServerName={0})(cssServerIP={0})(cssServerFQDN={0}))",
        "default_attrs": None,
        "filter_attrs": None,
    },
    "sysconf_details": {
        "base_dn": BaseDN.sysconf,
        "default_filter": "(objectClass=sysConf)",
        "filter_template": None,
        "default_attrs": ["sysconfData", "sysconfAttribute"],
        "filter_attrs": None,
    },
}


class LDAPFetcher:
    """
    A class for fetching LDAP entries.

    """

    def __init__(self, connection_manager):
        """
        Initialize the Fetcher.

        Args:
            connection_manager (LDAPConnectionManager): Manages LDAP connection.
        """
        self.connection_manager = connection_manager

    def _fetch(self, base_dn, search_filter="(objectClass=*)", attributes=None, scope="SUBTREE"):
        """
        Fetch LDAP entries matching specified query parameters.

        Args:
            base_dn (str): The base DN for the search.
            search_filter (str): The LDAP search filter.
            attributes (list, optional): List of attributes to fetch. Defaults to None.
            scope (int, optional): The scope of the search. Defaults to ldap.SCOPE_SUBTREE.

        Returns:
            list: A list of (dn, entry) tuples for each matching entry.
        """

        def query(connection, base_dn, search_filter, attributes=None, scope=ldap.SCOPE_SUBTREE):
            """
            Fetch entries from the LDAP directory.

            Args:
                connection: The LDAP connection object.
                base_dn (str): The base DN for the search.
                search_filter (str): The LDAP search filter.
                attributes (list, optional): List of attributes to fetch. Defaults to None.
                scope (int, optional): The search scope. Defaults to ldap.SCOPE_SUBTREE.

            Returns:
                list: The search results.
            """
            scope_map = {
                "BASE": ldap.SCOPE_BASE,
                "ONELEVEL": ldap.SCOPE_ONELEVEL,
                "SUBTREE": ldap.SCOPE_SUBTREE,
            }

            if scope.upper() not in scope_map:
                raise KeyError("\n  Invalid LDAP scope for search: {0}.".format(scope))

            ldap_scope = scope_map.get(scope.upper())
            return connection.search_s(base_dn, ldap_scope, search_filter, attributes)

        return self.connection_manager.with_connection(query, base_dn, search_filter, attributes, scope)

    def fetch(self, method_name, filter_value=None, base_dn=None):
        """
        Dynamically fetches LDAP records based on fetch_type.

        Args:
            method_name (str): The name of the fetch method.
            filter_value (str, optional): The value used for filtering.
            base_dn (str, optional): Custom base DN.

        Returns:
            list: A list of (dn, entry) tuples.
        """
        config = FETCH_CONFIG.get(method_name)
        if not config:
            raise ValueError("Invalid fetch method: {0}".format(method_name))

        base_dn = base_dn or config["base_dn"]
        default_filter = config.get("default_filter", "(objectClass=*)")


        if "filter_function" in config:
            filter = config["filter_function"]()
            search_filter = "(|{0}{1})".format(
                config["conditions"][0].format(filter=filter),
                config["conditions"][1]
            )
        else:
            if isinstance(filter_value, list):
                search_filter = (
                    config["filter_template"].format(*filter_value) if (filter_value and config["filter_template"]) else default_filter
            )
            else:
                search_filter = (
                    config["filter_template"].format(filter_value) if (filter_value and config["filter_template"]) else default_filter
            )


        attributes = config["filter_attrs"] if filter_value else config["default_attrs"]

        return self._fetch(base_dn=base_dn, search_filter=search_filter, attributes=attributes)


class LDAPOutputHandler:
    """
    Handles formatting, displaying, and writing of LDAP-related results.
    """

    def format_user_details(self, data, filter_value):
        """
        Formats results for user details for visual presentation.

        Args:
            data (list): A list of (dn, entry) tuples representing user LDAP entries.
            filter_value (str): the value used for filtering

        Returns:
            str: A formatted string of user details.
        """
        if not data:
            sleep(1)
            return "\nNo entries found for user '{0}'.\n".format(filter_value)

        output = []
        for dn, entry in data:
            table = "{0}".format(dn.split(",")[1][3:]).upper()
            title = self._format_title(table)
            output.append(title)
            for attr, values in entry.items():
                output.append("  {0}: {1}".format(attr, ", ".join(values)))
        output.append("")
        return "\n".join(output)

    def format_user_groups(self, data, filter_value=None):
        """
        Formats results for user's group details.

        Args:
            data (list): A list of (dn, entry) tuples for users group LDAP entries.
            filter_value (str, optional): The value used for filtering.

        Returns:
            str: A formatted string of user's group details
        """
        if not data:
            sleep(1)
            return "\nNo group entries found for user {0}.\n".format(filter_value)

        output = []
        title = self._format_title("Group Membership" if filter_value else "All Groups", filter_value)
        output.append(title)

        groups = sorted([entry["cn"] for _, entry in data if "cn" in entry])

        for group in groups:
            output.append("  {0}".format("".join(group)))
        output.append("")
        return "\n".join(output)

    def format_user_registration(self, data, filter_value):
        """
        Formats result for user's registration status.

        Args:
            data (list): A list of (dn, entry) tuples for users registration LDAP entries.
            filter_value (str): The value used for filtering.

        Returns:
            str: A formatted string of user's registration details
        """
        if not data:
            sleep(1)
            return "\nNo entries found for user '{0}' on APPUSR_TABLE.\n".format(filter_value)

        bt_users = set(["supbtusr", "imabtusr", "admbtusr", "omsbtusr"])

        output = []
        output.append(
            self._format_title(
                "App Registration",
                filter_value if filter_value else "batch users"
            )
        )

        def format_entry(entry, filter_value):
            app = entry["cssApplicationName"][0]
            registered = "Yes" if entry["cssAppRegistered"][0] == "1" else "No"
            user_login = entry["userLogin"][0]

            # Format for batch users if not filter_value
            if filter_value:
                return "  {0}:  {1}".format(app, registered)
            elif user_login in bt_users:
                return " {0}:  {1} - {2}".format(user_login, app, registered)
            return None

        # Process entries
        formatted_entries = [
            format_entry(entry, filter_value)
            for _, entry in data if entry
        ]

        # Add formatted entries, skipping any None results
        output.extend(filter(None, formatted_entries))
        output.append("")

        return "\n".join(output)

    def format_app_admins_report(self, app_admin_logins, auth_user_details):
        """
        Format application administrator report for output.

        Args:
            app_admin_logins (list): Logins fetched from APPUSER_TABLE.
            auth_user_details (dict): Detailed user information from AUTH_TABLE.

        Returns:
            str: A formatted string of application admin details.
        """
        output = ["\n{0:^112}\n{1:^112}".format("APP ADMINISTRATOR REPORT", "=" * 26)]

        for app_name, user_details in sorted(auth_user_details.items()):
            output.append("{0} APP ADMINS ({1})".format(app_name, len(user_details)))
            output.append("=" * 112)
            output.append("{0:<8} | {1:<25} | {2:<20} | {3:<30} | {4:<12}".format(
                "Login", "Full Name", "Windows Login", "Email", "Phone"
            ))
            output.append("=" * 112)

            for detail in user_details:
                output.append("{0:<8} | {1:<25} | {2:<20} | {3:<30} | {4:<12}".format(
                    detail["login"], detail["name"], detail["windows_login"], detail["email"], detail["phone"]
                ))

            output.append("\n")

        return "\n".join(output)

    def format_printer_details(self, data, filter_value=None):
        """
        Formats results for printer details.

        Args:
            data (list): A list of (dn, entry) tuples for printer detail LDAP entries.
            filter_value (str, optional): The value used for filtering.

        Returns:
            str: A formatted string of printer details
        """
        if not data:
            sleep(1)
            return "\nNo entries found for printer '{0}'.\n".format(filter_value)

        output = []

        if not filter_value:
            rec_ct = len([entry for _, entry in data if entry])
            output.append(self._format_title("Printers", rec_ct, 102))
        for _, entry in data:
            if not filter_value and entry:
                name = entry["printerName"][0].strip()
                ip = entry["printerIP"][0].strip()
                loc = entry["printerLocation"][0].strip()
                output.append("  Printer Name: {0:<20} IP Address: {1:<20} Location: {2:<20}".format(name, ip, loc))
            elif entry:
                output.append(self._format_title("Printer Details"))
                for attr, values in entry.items():
                    output.append("  {0}:  {1}".format(attr, ", ".join(values)))
                output.append("")
        output.append("")

        return "\n".join(output)

    def format_duplicate_printers(self, data, filter_value=None):
        """
        Formats and filters printers with duplicate IPs.

        Args:
            records (list): LDAP search results containing (dn, {attributes}) tuples.

        Returns:
            str: Formatted output showing only printers with duplicate IPs.
        """
        ip_to_printers = {}  # {printerIP: [printerNames]}

        for _, entry in data:
            printer_name = entry.get("printerName", ["Unknown"])[0]
            printer_ip = entry.get("printerIP", ["Unknown"])[0]

            if printer_ip in ip_to_printers:
                ip_to_printers[printer_ip].append(printer_name)
            else:
                ip_to_printers[printer_ip] = [printer_name]

        # Filter only duplicate IPs
        duplicates = {}
        for ip, names in ip_to_printers.items():
            if len(names) > 1:
                duplicates[ip] = names

        if not duplicates:
            return "\n  No duplicate printer IPs found.\n"

        output = []
        output.append(self._format_title("Duplicate Printer IPs"))
        output.append("  {0:<20} {1}".format("Printer IP", "Printer Names"))
        output.append("  {0:<20} {1}".format("-" * 12, "-" * 25))

        for ip, printers in sorted(duplicates.items()):
            output.append("  {0:<20} {1}".format(ip, ", ".join(printers)))

        output.append("")

        return "\n".join(output)

    def format_adapter_details(self, data, filter_value=None):
        """
        Formats results for apdapter details.

        Args:
            data (list): A list of (dn, entry) tuples for adapter LDAP entries.
            filter_value (str, optional): The value used for filtering.

        Returns:
            str: A formatted string of adapter details.
        """
        if not data:
            sleep(1)
            return "\nNo entries found for adapter '{0}'.\n".format(filter_value)

        output = []

        if not filter_value:
            rec_ct = len([entry for _, entry in data if entry])
            output.append(self._format_title("Adapters", rec_ct, 80))
        for _, entry in data:
            if not filter_value and entry:
                ip = entry["adapterIP"][0].strip()
                fqdn = entry["adapterFQDN"][0].strip()
                typ = entry["adapterType"][0].strip()
                output.append("  Adapter IP: {0:<15} Adapter FQDN: {1:<15} Adapter Type: {2:<15}".format(ip, fqdn, typ))
            elif entry:
                output.append(self._format_title("Adapter Details"))
                for attr, values in entry.items():
                    output.append("  {0}:  {1}".format(attr, ", ".join(values)))
                output.append("")
        output.append("")

        return "\n".join(output)

    def format_host_details(self, data, filter_value):
        """
        Formats results for host details.

        Args:
            data (list): A list of (dn, entry) tuples for host LDAP entries.
            filter_value (str): The value used for filtering.

        Returns:
            str: A formatted string of host details
        """
        if not data:
            sleep(1)
            return "\nNo entries found for host '{0}'.\n".format(filter_value)

        output = []
        title = self._format_title("Host Details")
        output.append(title)
        for _, entry in data:
            if not filter_value:
                output.append("")
            for attr, values in entry.items():
                output.append("  {0}:  {1}".format(attr, ", ".join(values)))
        output.append("")

        return "\n".join(output)

    def format_sysconf_details(self, data, filter_value=None):
        """
        Formats results for sysconf details.

        Args:
            data (list): A list of (dn, entry) tuples for sysconf LDAP entries.
            filter_value (str): The value used for filtering.

        Returns:
            str: A formatted string of host details
        """
        if not data:
            sleep(1)
            return "\nNo entries found on SYSCONF_TABLE.\n"

        output = []
        title = self._format_title("SysConf Details")
        output.append(title)

        for _, entry in data:
            if entry:
                sysconf_data = entry["sysconfData"][0]
                sysconf_attr = entry["sysconfAttribute"]
                output.append("  {0}:  {1}".format(sysconf_data, ", ".join(sysconf_attr)))
        output.append("")

        return "\n".join(output)

    def format_web_users_report(self, data, filter_value=None):
        """
        Formats results for for web user or ntcss web admin details.

        Args:
            data (list): A list of (dn, entry) tuples for web user LDAP entries.
            filter_value (str): The value used for filtering.

        Returns:
            str: A formatted string of host details
        """
        if not data:
            sleep(1)
            return "\nNo entries found on NTCSS_WEB_USERS Table.\n"

        output = []
        if not filter_value:
            output.append("\n{0:^106}\n{1:^106}".format("NTCSS WEB ACCESS", "=" * 18))

        # Group data by org unit
        grouped_data = self._group_data_by_ou(data, filter_value)

        # Format grouped data
        self._format_grouped_data(grouped_data, filter_value, output)

        return "\n".join(output)

    def _group_data_by_ou(self, data, filter_value=None):
        """
        Groups LDAP entries by 'ou' and filters for specific conditions.

        Args:
            data (list): A list of (dn, entry) tuples.
            filter_value (str, optional): The value used for filtering.

        Returns:
            dict: A dictionary grouped by 'ou', with lists of user attributes.
        """
        grouped_data = {}

        for dn, attrs in data:
            # Extract 'ou' from DN
            ou = next((part.split("=")[1] for part in dn.split(",") if part.startswith("ou=")), None)

            # Skip non-matching entries if filter_value is provided
            if filter_value and ou != "NTCSS_ADMIN":
                continue

            if ou:
                grouped_data.setdefault(ou, []).append(attrs)

        return grouped_data

    def _format_grouped_data(self, grouped_data, filter_value, output):
        """
        Formats grouped data and appends it to the output.

        Args:
            grouped_data (dict): Grouped data by 'ou'.
            filter_value (str): The value used for filtering.
            output (list): The output list to append formatted strings.
        """
        for ou, users in sorted(grouped_data.items()):
            if ou and ou not in set(["USER", "NTCSS_USER"]):
                user_ct = len(users)
                ou_title = "BCMI/GICRL ADMIN" if ou == "ADMIN" else ou
                full_group_title = self._format_title(ou_title, user_ct, 100)
                output.append(full_group_title)

                for user in users:
                    sn = user.get("sn", ["N/A"])[0]
                    cn = user.get("cn", ["N/A"])[0]
                    email = user.get("mail", [None])[0]
                    descr = user.get("description", [None])[0]
                    output.append("  sn: {0:<8} cn: {1:<40} {2}: {3:40}".format(
                        sn,
                        cn,
                        "email" if ou == "NTCSS_ADMIN" else "description",
                        email if email else descr if descr else ""
                    ))
            output.append("")

    def format_group_counts(self, data, filter_value=None):
        """
        Formats group count data for display.

        Args:
            data (list): A list of (dn, entry) tuples for group LDAP entries.
            filter_value (str, optional): The value used for filtering.

        Returns:
            str: A formatted string of group and user counts.
        """
        gid_map = {
            "1001": "ntcss",
            "1002": "rsupply",
            "1003": "ommsng",
            "1004": "radm",
            "1005": "nalcomis",
            "1006": "pomsng",
        }

        # Group entries by application
        group_dict = self._group_data_by_gid(data, gid_map)

        # Initialize counters
        total_group_ct = 0
        all_users = []

        output = []
        title = self._format_title("All Group and User Counts")
        output.append(title)

        for app, groups in group_dict.items():
            group_ct = len(groups)
            user_ct = sum(len(members) for members in groups.values())
            total_group_ct += group_ct

            output.append(
                "  Found {group_ct} {app} group{s} with {user_ct} total users".format(
                    group_ct=group_ct,
                    app=app,
                    s="" if group_ct == 1 else "s",
                    user_ct=user_ct
                )
            )
            all_users.extend([user for members in groups.values() for user in members])

        output.append("\n  Total Users:  {0}\n  Total Groups:  {1}\n".format(
            len(set(all_users)),
            total_group_ct
        ))
        return "\n".join(output)

    def _group_data_by_gid(self, data, gid_map):
        """
        Groups LDAP entries by GID and maps them to applications.

        Args:
            data (list): A list of (dn, entry) tuples for group LDAP entries.
            gid_map (dict): A dictionary mapping GIDs to application names.

        Returns:
            dict: A dictionary where keys are applications and values are dictionaries
                  of group names and their members.
        """
        group_dict = {}
        for _, entry in data:
            group_name = entry.get("cn", [None])[0]
            gid = entry.get("gidNumber", [None])[0]
            members = entry.get("memberUid", [])

            # Map GID to application
            gid_key = gid_map.get(gid)
            if not gid_key:
                continue

            group_dict.setdefault(gid_key, {})[group_name] = members

        return group_dict

    def _format_title(self, title, subtitle=None, length=50):
        """
        Format table title.

        Args:
            title (str): The output title.
            subtitle (str, optional): The filter value to include in the title.
            length (int, optional): The total length of formatted title line.
                                    Default: 50

        Returns:
            str: A formatted title string
        """
        full_title = full_title = "{0} ({1})".format(title, subtitle) if subtitle else title
        border = "=" * int((length - len(title)) / 2)

        return "\n {0} {1} {0}\n".format(border, full_title)

    def display(self, data, format_method=None, filter_value=None, preformatted_data=None):
        """
        Displays formatted user details to the console.

        Args:
            data (str or list): Raw data for formatting, or `None` if preformatted data is provided.
            format_method (callable): The formatting method to apply to the data.
            filter_value (str, optional): The value used for filtering.
            preformatted_data (str, optional): Preformatted output to display directly.

        Returns:
            None
        """
        if (format_method is None or not callable(format_method)) and not preformatted_data:
            raise ValueError("format_method must be callable: {0}.".format(format_method))

        # If data is None, assume it's prefomatted and pass through formatted data
        if preformatted_data is not None:
            formatted_details = preformatted_data
        else:
            if not data:
                print("\n  No entries found for '{0}'.\n".format(filter_value))
                return

            formatted_details = format_method(data, filter_value=filter_value)

        print(formatted_details)

        return formatted_details

    def write(self, data, filename):
        """
        Writes formatted data to file.

        Args:
            data (str): The data to write.
            filename (str): The name of the file created.

        Returns:
            None
        """
        try:
            with open(filename, "w") as wf:
                wf.write(data)
            print("\n  Output saved to file: {0}\n".format(filename))
        except IOError as e:
            print("\n  Failed to save output: {0}\n".format(e))


class Command(object):
    """
    Abstract base class for all command objects.

    Provides a common interface for executing commands.

    Attributes:
        None

    Methods:
        execute():
            Abstract method to be implemented by all subclasses. Executes
            the encapsulated command logic.
    """

    __metaclass__ = ABCMeta

    @abstractmethod
    def execute(self):
        """
        Executes the command's action. Must be implemented by subclasses.

        Args:
            None

        Returns:
            None
        """
        pass


class GenericCommand(Command):
    """
    A generic command that delegates execution to a specific service method
    and dynamically handles output operations.

    Args:
        service (object): The service instance to call.
        method_name (str): The name of the method to invoke on the service.
        output_handler (LDAPOutputHandler): Handles output operations.
        output_method_name (str): The name of the output method to invoke on the output handler.
        **kwargs: Additional arguments for the service method.
    """

    def __init__(self, service, method_name, output_handler, format_method_name, fetch_method_name, **kwargs):
        self.service = service
        self.method_name = method_name
        self.output_handler = output_handler
        self.fetch_method_name = fetch_method_name
        self.kwargs = kwargs

        self.format_method = getattr(self.output_handler, format_method_name, None)
        if not self.format_method:
            raise ValueError(
                "Format method '{0}' not found in LDAPOutputHandler.".format(format_method_name)
            )

    def execute(self):
        """
        Executes the command by calling the specified service method and handling the output dynamically.
        """
        # Get service method
        method = getattr(self.service, self.method_name)
        # Extract service kwargs
        filter_value = self.kwargs.get("filter_value")
        filter_value = None if filter_value == "all" else filter_value
        base_dn = self.kwargs.get("base_dn", None)
        result = method(self.fetch_method_name, filter_value, base_dn)

        os.system("clear")
        if self.format_method:
            # Display
            return self.output_handler.display(
                data=result,
                format_method=self.format_method,
                filter_value=filter_value,
            )

        return result


class AppAdminsCommand(Command):
    """
    A command to handle execution of multiple queries for the application administrator report.

    Args:
        service (object): The service instance to call.
        method_name (str): The name of the method to invoke on the service.
        output_handler (LDAPOutputHandler): Handles output operations.
        output_method_name (str): The name of the output method to invoke on the output handler.
        **kwargs: Additional arguments for the service method.
    """
    """
    Command to handle app administrators, including fetching, formatting, and displaying their details.
    """

    def __init__(self, service, method_name, output_handler, format_method_name, **kwargs):
        self.service = service
        self.method_name = method_name
        self.output_handler = output_handler
        self.format_method_name = format_method_name
        self.kwargs = kwargs

    def execute(self):
        """
        Executes the command to fetch app admins and their details,
        format the results, and display/write output.
        """
        # Fetch app admin logins
        app_admin_logins = self.service.fetch("app_admin_logins")

        # Fetch details for each admin
        auth_user_details = {}
        for _, entry in app_admin_logins:
            app_name = entry.get("cssApplicationName", ["Unknown"])[0]
            user_login = entry.get("userLogin", [None])[0]
            auth_results = self.service.fetch("app_admin_details", user_login)
            auth_user_details.setdefault(app_name, [])
            if auth_results:
                _, attributes = auth_results[0]
                auth_user_details[app_name].append({
                    "login": user_login,
                    "name": attributes.get("ntcssUserName", ["N/A"])[0],
                    "windows_login": attributes.get("principalName", ["N/A"])[0],
                    "email": attributes.get("emailAddr", ["N/A"])[0],
                    "phone": attributes.get("ntcssUserPhone", ["N/A"])[0],
                })

        # Format results
        formatted_output = self.output_handler.format_app_admins_report(app_admin_logins, auth_user_details)

        os.system("clear")
        # Display the results
        self.output_handler.display(
            data=None,
            format_method=getattr(self.output_handler, self.format_method_name),
            filter_value=None,
            preformatted_data=formatted_output,
        )

        return formatted_output


class LDAPModifier:
    """
    Handles LDAP modification operations for modifying, adding, and deleting records.
    """

    def __init__(self, fetcher):
        """
        Initialize the LDAPModifier.

        Args:
            fetcher (LDAPFecter): The fetcher responsible for retrieving and display LDAP records.
        """
        self.fetcher = fetcher

    def add_record(self, dn, attributes):
        """Handles adding a new record to LDAP."""
        record = [(attr, values) for attr, values in attributes.items()]

        return self.fetcher.connection_manager.with_connection(
            lambda conn: conn.add_s(dn, record), 
            bind_method="user"
        )

    def modify_record(self, mod_type, dn, changes):
        """Handles updating an existing record."""
        mod_actions = {
            "replace": ldap.MOD_REPLACE,
            "add": ldap.MOD_ADD,
            "delete": ldap.MOD_DELETE,
        }

        mod_list = [(mod_actions.get(mod_type), attr, values) for attr, values in changes.items()]

        return self.fetcher.connection_manager.with_connection(
            lambda conn: conn.modify_s(dn, mod_list),
            bind_method="user"
        )

    def delete_record(self, dn):
        """Handles deleting an existing record."""

        return self.fetcher.connection_manager.with_connection(
            lambda conn: conn.delete_s(dn),
            bind_method="user"
        )

class LDAPModifyCommand(Command):
    """
    Handles modification of LDAP records, including fetching, displaying, and updating.
    """

    def __init__(self, service, method_name, output_handler, format_method_name, fetch_method_name, base_dn, dn_attr, post_op, **kwargs):
        """
        Initializes the ModifyCommand.

        Args:
            service (LDAPModifier): The LDAP modification service.
            method_name (str): The method to invoke on the service.
            output_handler (LDAPOutputHandler): Handles output operations.
            format_method_name (str): Formatting method for output.
            kwargs (dict): Additional arguments, including `filter_value`, `base_dn`, and `fetch_method_name`.
        """
        self.service = service
        self.method_name = method_name
        self.output_handler = output_handler
        self.format_method = getattr(output_handler, format_method_name, None)
        self.fetch_method_name = fetch_method_name
        self.base_dn = base_dn
        self.dn_attr = dn_attr
        self.post_op = post_op
        self.kwargs = kwargs
        self.filter_value = self.kwargs.get("filter_value")
        self.mod_type = self.kwargs.get("mod_type")

        # Initialize LDAPChangeTracker for undo capability
        self.change_tracker = LDAPChangeTracker()

    def execute(self):
        """
        Executes the modification command.

        Returns:
            bool: True if modification succeeds, False otherwise.
        """
        # Ensure required parameters are passed
        if not self._validate_parameters():
            return False

        # Get record if exists
        record = self._fetch_record()
        os.system("clear")

        if record:
            result = self._handle_existing_record(record)
        else:
            result = self._handle_missing_record()
            if not result:
                return False

        self._handle_result(result)

        return result

    def _validate_parameters(self):
        """
        Ensures required paramters are provided before execution.

        Args:
            None

        Returns:
            bool: Prints error msg and returns False or return True.
        """
        if not self.base_dn and self.method_name != "mod_sysconf" and not self.filter_value:
            print("\n  Error: Missing required parameters for modification.")
            return False
        return True

    def _fetch_record(self):
        """Fetches the LDAP record."""
        fetch_method = getattr(self.service.fetcher, "fetch", None)
        return fetch_method(self.fetch_method_name, self.filter_value, self.base_dn)

    def _handle_existing_record(self, record):
        """Handles modifcation when a record exists in LDAP."""
        self.output_handler.display(data=record, format_method=self.format_method, filter_value=self.filter_value)
        mod_dn = record[0][0]

        if self.mod_type == "d":
            return self._handle_delete(mod_dn, record)
        elif self.mod_type == "a":
            return self._handle_add_existing()
        elif self.mod_type == "m":
            return self._handle_modify(mod_dn, record)

    def _handle_delete(self, mod_dn, record):
        """Handles deletion of an existing record."""
        confirm = raw_input("\n  Are you sure you want to delete the record for {0}? (y/n): ".format(self.filter_value)).strip().lower()
        if confirm != "y":
            print("\n  Delete record, Cancelled.")
            return

        self.change_tracker.log_deletion(mod_dn, record)
        result = self.service.delete_record(mod_dn)

        if result and self.post_op:
            self._execute_post_operations(record)

        return bool(result)

    def _handle_add_existing(self):
        """Handles the scenario where an entry exists but user attempts to add it."""
        print("\n  Entry already exists for {0}.".format(self.filter_value))
        confirm = raw_input("\n  Modify record? (y/n): ").strip().lower()
        if confirm != "y":
            return
        self.mod_type = "m"
        return self._handle_modify(self.base_dn, self._fetch_record())

    def _handle_modify(self, mod_dn, record):
        """Handles modifications to an existing record."""
        action, changes = self._get_modification_input(record, mod_dn)
        if not changes:
            print("\n  No modifications provided. Exiting...")
            sleep(1)
            return False

        if self.method_name == "mod_sysconf":
            orig_values = self._get_sysconf_originals(record)
        else:
            orig_values = {}
            for attr in changes.keys():
                orig_values[attr] = record[0][1].get(attr, [])

        self.change_tracker.log_modification(mod_dn, orig_values)

        if self.method_name == "mod_sysconf":
            result = self._modify_sysconf(changes)
        else:
            result = self.service.modify_record(action, mod_dn, changes)

        return result

    def _get_sysconf_originals(self, record):
        """
        Extracts original sysconf values in the format:
        {sysconfData value: sysconfAttribute value}

        Args:
            record (list): LDAP search result for sysconf modifications.

        Returns:
            dict: Mapping of sysconfData to sysconfAttribute.
        """
        original_values = {}

        for entry in record:
            dn, attributes = entry
            sysconf_data = attributes.get("sysconfData", [None])[0]
            sysconf_attr = attributes.get("sysconfAttribute", [""])

            if sysconf_data:
                original_values[sysconf_data] = sysconf_attr

        return original_values

    def _get_modification_input(self, record, mod_dn):
        """Prompts user for modification input based on method type."""
        if self.method_name == "mod_regstr":
            return ("replace", self._prompt_for_add_attributes())
        elif self.method_name == "mod_sysconf":
            return self._prompt_for_sysconf_mods(record)
        elif self.method_name == "mod_group":
            return self._prompt_for_group_mods(record, mod_dn)
        return self._prompt_for_modifications(record, mod_dn)

    def _modify_sysconf(self, changes):
        """Handles modification for 'mod_sysconf' separately."""
        result = {}
        for tag, value in changes.items():
            mod_dn = "sysconfData={0},{1}".format(tag, self.base_dn)
            result[mod_dn] = self.service.modify_record("replace", mod_dn, {"sysconfAttribute": value})
        return result

    def _handle_missing_record(self):
        """Handles the scenario where the record is missing."""
        if self.mod_type in ["d", "m"]:
            print("\n  No entry exists for {0}.".format(self.filter_value))
            confirm = raw_input("\n  Add record? (y/n): ").strip().lower()
            if confirm != "y":
                return
            self.mod_type = "a"

        if self.mod_type == "a":
           return self._handle_add_new()
     
    def _handle_add_new(self):
        """Handles adding a new LDAP record."""
        mod_dn = "{0}={1},{2}".format(self.dn_attr, self.filter_value, self.base_dn)

        attributes = self._prompt_for_add_attributes()
        if not attributes:
            print("\n  No attributes provided. Exiting...")
            sleep(1)
            return

        self.change_tracker.log_addition(mod_dn)
        result = self.service.add_record(mod_dn, attributes)

        if result and self.post_op:
            self._execute_post_operations(attributes)

        return bool(result)

    def _handle_result(self, result):
        """Handles displaying the final result and prompting for undo."""
        if result:
            print("\n  Record updated successfully.")
        else:
            print("\n  Failed to update record.")

        # Display updated record
        record = self._fetch_record()
        self.output_handler.display(data=record, format_method=self.format_method, filter_value=self.filter_value)

        # Prompt to undo or continue
        undo_choice = raw_input("\n  Enter (U)ndo or (C)ontinue: ").strip().lower()
        if undo_choice == "u":
            self._undo_last_change()
            # Display updated record after undo
            record = self._fetch_record()
            self.output_handler.display(data=record, format_method=self.format_method, filter_value=self.filter_value)

            raw_input("\n  Press [Enter] to continue.")

    def _prompt_for_modifications(self, record, mod_dn):
        """
        Prompts user for multiple modifications to an LDAP record.

        Args:
            record (dict): The LDAP record to modify.
            mod_dn (str): The dn for the LDAP record
        Returns:
            dict: Dictionary containing the changes to apply.
        """
        pattern = r"([\w]+)(?==)"
        no_update_attrs = re.findall(pattern, mod_dn.split(",", 1)[0])

        action = "replace"
        changes = {}
        while True:
            attr = raw_input("\n  Enter attribute to modify (or press Enter to finish): ").strip()
            if not attr:
                break
            elif attr not in record[0][1]:
                print("\n    Attribute not found.")
                continue
            elif attr in no_update_attrs:
                print("\n    Cannot update key value '{0}'.".format(attr))
                continue
            new_value = raw_input("  Enter new value for {0}: ".format(attr)).strip()
            changes[attr] = new_value.split(",")

        return action, changes

    def _prompt_for_sysconf_mods(self, record):
        """
        Prompts user for sysconfData Modifications.

        Args:
            record (dict): The LDAP record to modify.

        Returns:
            dict: Dictionary containing the changes to apply.
        """
        changes = {}
        action = "replace"
        while True:
            tag = raw_input("\n  Enter the sysconfData attribute to modify (or press Enter to finish): ").strip()
            if not tag:
                break
            if not any(tag in tags.get("sysconfData", []) for _, tags in record):
                print("\n    Attribute not found.")
                continue
            new_value = raw_input("  Enter new value for {0}: ".format(tag)).strip()
            changes[tag] = new_value.split(",")

        return action, changes

    def _prompt_for_group_mods(self, record, mod_dn):
        """
        Prompts user for group modifications.

        Args:
            record (dict): The LDAP record to modify.

        returns:
            tuple (str, dict): A tuple contain the ldap mod type and the changes to apply.
        """
        changes = {}
        login = ""
        action = ""
        while not login:
            attr = "memberUid"
            login = raw_input("  Enter user login to add/delete from {0} or (Q)uit): ".format(self.filter_value)).strip()

            if login.lower() in ["q", "quit"]:
                break
            group_members = record[0][1]["memberUid"]
            member_ct = len(group_members)
            action = "delete" if login in group_members else "add"

            if action == "add" and member_ct >= 50:
                login = ""
                print("\n  Can not add members to {0}; (member count=50 (max members=50)".format(self.filter_value))
                sleep(2)
                continue

            changes[attr] = login.split(",")

        return action, changes


    def _prompt_for_add_attributes(self):
        """
        Prompts the user for attributes when adding a new LDAP entry.

        Args:
            object_type (str): The type of LDAP object (e.g., 'user', 'group', 'printer').

        Returns:
            dict: A dictionary containing the attributes and values in LDAP add format.
        """
        # Define required attributes per object type
        attribute_templates = {
            "mod_auth": {
                "prompt": [
                    "authLock",
                    "authPWTime",
                    "authRole",
                    "authSSN",
                    "authSecurity",
                    "authServerName",
                    "authUid",
                    "dbLogin",
                    "emailAddr",
                    "ntcssUserName",
                    "ntcssUserPassword",
                    "ntcssUserPhone",
                    "principalName",
                ],
                "static": {
                    "userLogin": self.filter_value,
                    "objectClass": ["userAuthServer", "top"],
                }
            },
            "mod_people": {
                "prompt": [
                    "uidNumber",
                    "gidNumber",
                    "homeDirectory",
                    "userPassword",
                ],
                "static": {
                    "uid": self.filter_value,
                    "cn": self.filter_value,
                    "loginShell": "/bin/csh",
                    "description": "NTCSS User account",
                    "objectClass": ["top", "account", "posixAccount", "shadowAccount"],
                }
            },
            "mod_prntr": {
                "prompt": [
                    "printerHostName",
                    "printerLocation",
                    "printerMaxbytes",
                    "printerInterfaceFile",
                    "printerIP",
                    "printerSecurityClass",
                    "printerStatus",
                    "printerPort",
                    "printerSuspendFlag",
                    "printerFileName",
                    "printerApps",
                    "printerNTDriver",
                    "printerFQDN",
                ],
                "static": {
                    "printerName": self.filter_value,
                    "printerRedirectedPrinter": "None",
                    "objectClass": ["top", "cssPrinter"],
                }
            },
            "mod_adptr": {
                "prompt": [
                    "adapterLocation",
                    "adapterMAC",
                    "adapterType",
                    "adapterFQDN",
                ],
                "static": {
                    "adapterIP": self.filter_value,
                    "objectClass": ["adapters", "top"],
                }
            },
            "mod_adptyp": {
                "prompt": [
                    "adapterPort",
                    "adapterConfigScript",
                ],
                "static": {
                    "adapterType": self.filter_value,
                    "objectClass": ["adapterTypes", "top"],
                }
            },
            "mod_host": {
                "prompt": [
                    "cssReplicationStatus",
                    "cssServerIP",
                    "cssServerMaxBatch",
                    "cssServerType",
                    "cssServerFQDN",
                ],
                "static": {
                    "adapterIP": self.filter_value,
                    "objectClass": ["cssHosts", "top"],
                }
            },
            "mod_appusr": {
                "prompt": [
                    "ntcssUserName",
                    "cssAppData",
                    "cssAppRole",
                    "cssAppRegistered",
                    "cssAppDB",
                ],
                "static": {
                    "userLogin": self.filter_value[0],
                    "cssApplicationName": self.filter_value[1],
                    "objectClass": ["cssAppUsers", "top"],
                }
            },
            "mod_regstr": {
                "prompt": ["cssAppRegistered"],
                "static": {
                    "userLogin": self.filter_value[0],
                    "cssApplicationName": self.filter_value[1],
                }
            },
            "mod_group": {
                "prompt": ["gidNumber", "memberUid"],
                "static": {
                    "cn": self.filter_value,
                    "objectClass": ["posixGroup", "top"],
                }
            }
        }
        attributes = {}
        method_config = attribute_templates.get(self.method_name, {})
        if not method_config:
            print("\n  Unknown object type. No attributes defined.")
            return {}

        if not self.method_name == "mod_regstr":
            print("\n  Enter values for the new record.")
        else:
            print("\n  (0=Unregister, 1=Register)")

        # Get attributes that require user input
        for attr in method_config.get("prompt", []):
            value = raw_input("  {0}: ".format(attr)).strip()
            if value:
                attributes[attr] = value.split(",")  

        # Return empty dict if no required attributes provided
        if not attributes:
            return {}

        # Add static attributes
        for attr, value in method_config.get("static", {}).items():
            attributes[attr] = value.split(",") if isinstance(value, str) else value

        return attributes

    def _execute_post_operations(self, data):
        """
        Initiates post record add/delete shell commands

        Args:
            data (dict): The LDAP entry results dict or the add attributes dict.

        Returns:
            None
        """
        mod_actions = {
            "a": {
                "post_people": self._post_people_add,
            },
            "d": {
                "post_people": self._post_people_del,
            }
        }

        if self.post_op in mod_actions[self.mod_type]:
            mod_actions[self.mod_type][self.post_op](data, self.filter_value)

    def _post_people_add(self, data, uid):
        user = uid

        prof_dir = "/h/NTCSSS/applications/data/unix_uga/shell"
        mail_dir = "/var/mail/{0}".format(self.filter_value)
        home_dir = data["homeDirectory"][0]
        mailrc =  "{0}/.mailrc".format(home_dir)
        cshrc = "{0}/.cshrc".format(home_dir)
        login = "{0}/.login".format(home_dir)
        profile = "{0}/.profile".format(home_dir)

        LDAPShellService.run_command("mkdir", "-p", home_dir)
        LDAPShellService.run_command("chmod", "750", home_dir)
        LDAPShellService.run_command("touch", mailrc, mail_dir)
        LDAPShellService.run_command("cp", "{0}/cshrc".format(prof_dir), cshrc)
        LDAPShellService.run_command("cp", "{0}/login".format(prof_dir), login)
        LDAPShellService.run_command("cp", "{0}/profile".format(prof_dir), profile)
        LDAPShellService.run_command("chmod", "740", mailrc, cshrc, login, profile)
        LDAPShellService.run_command("chgrp", "ntcss", home_dir, mailrc, profile)
        LDAPShellService.run_command("chown", "-R", "{0}".format(user), home_dir)
        LDAPShellService.run_command("chown", "{0}:mail".format(user), mail_dir)
        LDAPShellService.run_command("chmod", "660", mail_dir)

    def _post_people_del(self, data, uid):
        home_dir = data[0][1]["homeDirectory"][0]
        mail_dir = "/var/mail/{0}".format(self.filter_value)

        LDAPShellService.run_command("rm", "-rf", home_dir)
        LDAPShellService.run_command("rm", "-f", mail_dir)

    def _undo_last_change(self):
        """Undoes the last modification operation."""
        last_change = self.change_tracker.last_change()

        if not last_change:
            print("\n  No actions to undo.")
            return

        change_type = last_change["type"]
        mod_dn = last_change["dn"]

        if change_type == "add":
            print("\n  Undoing addition: Removing record {0}".format(mod_dn))
            result = self.service.delete_record(mod_dn)

        elif change_type == "modify":

            if self.method_name == "mod_sysconf":
                print("\n  Undoing modification: Restoring original values for sysconfData")
                result = {}
                for sysconf_data, orig_value in last_change["original"].items():
                    mod_dn = "sysconfData={0},{1}".format(sysconf_data, self.base_dn)
                    result[mod_dn] = self.service.modify_record("replace", mod_dn, {"sysconfAttribute": orig_value})

            else:
                print("\n  Undoing modification: Restoring original values for {0}".format(mod_dn))
                result = self.service.modify_record("replace", mod_dn, last_change["original"])

        elif change_type == "delete":
            print("\n  Undoing deletion: Restoring deleted record {0}".format(mod_dn))
            result = self.service.add_record(mod_dn, last_change["original"][0][1])

        if result:
            print("\n  Undo completed successfully.")

            return True

class LDAPChangeTracker:
    """
    Tracks LDAP modifications to enable undo functionality.
    """
    def __init__(self):
        self.changes = []  # List to store tracked changes

    def log_addition(self, dn):
        """Logs an added record to allow deletion during undo."""
        self.changes.append({"type": "add", "dn": dn})

    def log_modification(self, dn, original_values):
        """Logs modified attributes to restore their original values."""
        self.changes.append({"type": "modify", "dn": dn, "original": original_values})

    def log_deletion(self, dn, original_entry):
        """Logs a deleted record to allow re-adding it during undo."""
        self.changes.append({"type": "delete", "dn": dn, "original": original_entry})

    def last_change(self):
        """Retrieves and removes the last change."""
        return self.changes.pop() if self.changes else None


class LDAPShellCommand(Command):
    """
    A command that executes predefined shell scripts related to LDAP operations.

    Args:
        service (LDAPShellService): The service handling shell execution.
        method_name (str): The name of the method to invoke.
        **kwargs: Additional arguments to pass to the method.
    """

    def __init__(self, service, method_name, **kwargs):
        self.service = service
        self.method_name = method_name
        self.kwargs = kwargs

    def execute(self):
        """
        Executes the specified shell command.
        """
        # Ensure the method exists in the service
        method = getattr(self.service, self.method_name, None)
        if not method:
            raise ValueError("Method '{0}' not found in LDAPShellService.".format(self.method_name))

        # Call the shell execution method
        result = method(**self.kwargs)

        print("\n  Command Successful...\n")

        raw_input("  Press [Enter] to return ")


def initialize_invoker(fetcher, modifier, shell_service, output_handler):
    """
     Initializes the CommandInvoker with dynamically registered commands.

    Args:
        fetcher (LDAPFetcher): Fetcher instance for read operations.
        modifier (LDAPModifier): Modifier instance for write operations.
        shell_service (LDAPShellService): Service for running shell scripts.
        output_handler (LDAPOutputHandler): Handles formatting and display.

    Returns:
        CommandInvoker: The initialized invoker with registered commands.
    """
    command_invoker = LDAPCommandInvoker()

    # Define command to service mapping
    commands = {
        "web_admins_report": (fetcher, "fetch", "format_web_users_report", "web_users_report"),
        "app_admins_report": (fetcher, "app_admins_report", "format_app_admins_report"),
        "backup_ldap": (shell_service, "backup_ldap", None),
        "restore_ldap": (shell_service, "restore_ldap", None),
        "test_ldap": (shell_service, "test_ldap", None),
        "test_ldap_repl": (shell_service, "test_ldap_repl", None),
        "mod_auth": (modifier, "mod_auth", "format_user_details", "user_details", BaseDN.auth, "userLogin"),
        "mod_people": (modifier, "mod_people", "format_user_details", "user_details", BaseDN.people, "uid", "post_people"),
        "mod_prntr": (modifier, "mod_prntr", "format_printer_details", "printer_details", BaseDN.prntr, "printerName"),
        "mod_adptr": (modifier, "mod_adptr", "format_adapter_details", "adapter_details", BaseDN.adptr, "adapterIP"),
        "mod_adptyp": (modifier, "mod_adptyp", "format_adapter_details", "adapter_type", BaseDN.adptyp, "adapterType"),
        "mod_host": (modifier, "mod_host", "format_host_details", "host_details", BaseDN.host, "cssServerName"),
        "mod_appusr": (modifier, "mod_appusr", "format_user_details", "appusr_details", BaseDN.appusr, ["userLogin", "cssApplicationName"]),
        "mod_regstr": (modifier, "mod_regstr", "format_user_details", "appusr_regstr", BaseDN.appusr, ["userLogin", "cssApplicationName"]),
        "mod_group": (modifier, "mod_group", "format_user_details", "group_counts", BaseDN.group, "gidNumber"),
        "mod_sysconf": (modifier, "mod_sysconf", "format_sysconf_details", "sysconf_details", BaseDN.sysconf, "sysconfData"),
    }

    # Add Fetcher commands
    for command in FETCH_CONFIG.keys():
        commands[command] = (fetcher, "fetch", "format_{0}".format(command), command)

    # Register commands
    for command, values in commands.items():
        service, method_name, format_method_name = values[:3]
        fetch_method_name = values[3] if len(values) > 3 else None
        mod_args = values[4:] if len(values) > 4 else ()
        base_dn, dn_attr = mod_args[:2] if mod_args else (None, None)
        post_op = mod_args[2] if len(mod_args) > 2 else None

        factory = command_factory(
            service=service,
            method_name=method_name,
            output_handler=output_handler,
            format_method_name=format_method_name,
            fetch_method_name=fetch_method_name,
            base_dn=base_dn,
            dn_attr=dn_attr,
            post_op=post_op,
        )
        command_invoker.register_command(command, factory)

    return command_invoker


class LDAPCommandInvoker:
    """
    A class to manage and execute commands dynamically.
    """

    def __init__(self):
        """
        Initialize the CommandInvoker.
        """
        self.commands = {}

    def register_command(self, name, command_class):
        """
        Register a command for execution

        Args:
            name (str): Command name.
            command_class (type): Command class to instantiate.
        """
        self.commands[name] = command_class

    def execute_command(self, name, args):
        """
        Exectue the registered command.

        Args:
            name (str): Command name.
            args (dict): Arguments for the command.
        """
        command_class = self.commands.get(name)
        if not command_class:
            print("Command not found: {0}.".format(name))
            return

        command = command_class(**args)
        return command.execute()


class LDAPCLI:
    """
    A command-line interface (CLI) class to handle user-provided arguments and trigger LDAP operations.

    Attributes:
        helper (LDAPHelper): An instance of LDAPHelper to perform LDAP operations.
    """

    def __init__(self, connection_manager, command_invoker):
        """
        Initialize the LDAPCLI with an LDAPHelper instance.

        Args:
            ldap_helper (LDAPHelper): An instance of LDAPHelper to handle LDAP operations.
        """
        self.connection_manager = connection_manager
        self.invoker = command_invoker


    def run(self, args):
        """
        Execute the appropriate LDAPHelper function based on the parsed arguments.

        Args:
            args: Parsed command-line arguments.

        Returns:
            None
        """
        # Map CLI arguments to commands
        command_mapping = {
            "user": ("user_details", args.user),
            "printer": ("printer_details", args.printer),
            "adapter": ("adapter_details", args.adapter),
            "app_admin": ("app_admins_report", ""),
            "counts": ("group_counts", ""),
            "registered": ("user_registration", args.registered),
            "host": ("host_details", args.host),
            "web_admin": ("web_admins_report", "Admins"),
            "sysconf": ("sysconf_details", ""),
        }

        # Execute the first matching command
        for arg_name, (command_name, filter_value) in command_mapping.items():
            if getattr(args, arg_name, None):
                self.invoker.execute_command(command_name, {"filter_value": filter_value})
                break
        else:
            print("No valid command provided. Use --help for usage information.")


MENU = OrderedDict([
            ("1", {"description": "Get User's Details", "command": "user_details", "prompt": "  Enter login: ",
                "required": True}),
            ("2", {"description": "Get User's Groups", "command": "user_groups", "prompt": "  Enter login: ",
                "required": False}),
            ("3", {"description": "Get User's Registration", "command": "user_registration",
                "prompt": "  Enter login or Press [Enter] for btusr(s): ",  "required": False}),
            ("4", {"description": "Get App Admins", "command": "app_admins_report"}),
            ("5", {"description": "Get NTCSS Web Admins", "command": "web_admins_report", "filter_value": True}),
            ("6", {"description": "Get Web Users", "command": "web_users_report"}),
            ("7", {"description": "Get User and Group Counts", "command": "group_counts"}),
            ("8", {"description": "Get Printer Details", "command": "printer_details",
                "prompt": "  Enter name, ip, or Press [Enter] for all Printers: ", "required": False}),
            ("9", {"description": "Get Duplicate Printers", "command": "duplicate_printers"}),
            ("10", {"description": "Get Adapter Details", "command": "adapter_details",
                "prompt": "  Enter ip or Press [Enter] for all Adapters: ",
                "required": False}),
            ("11", {"description": "Get Host Details", "command": "host_details", "prompt": "  Enter ip, fqdn, or name: ",
                 "required": False}),
            ("12", {"description": "Get SysConf Details", "command": "sysconf_details"}),
            ("13", {"description": "Modify Records", "command": "modify_records"}),
            ("14", {"description": "Backup LDAP", "command": "backup_ldap"}),
            ("15", {"description": "Restore LDAP", "command": "restore_ldap"}),
            ("16", {"description": "Is LDAP Up?", "command": "test_ldap"}),
            ("17", {"description": "Test LDAP Replication (NTCSS 3.40 Force Level Only)", "command": "test_ldap_repl"}),
            ("q", {"description": "Quit", "command": None}),
        ])

class LDAPMenu:
    """
    A CLI menu-based utility to interact with the LDAPHelper class.

    Attributes:
        helper (LDAPHelper): An instance of LDAPHelper to perform LDAP operations.
        actions (dict): A mapping of menu options to corresponding actions (functions).
    """

    def __init__(self, connection_manager, command_invoker):
        """
        Initialize the LDAPMenu with an LDAPHelper instance.

        Args:
            helper (LDAPHelper): An instance of LDAPHelper to handle LDAP operations.
        """
        self.connection_manager = connection_manager
        self.invoker = command_invoker

        # Define actions with menu description and command to execute
        self.actions = MENU

    def display_menu(self):
        """
        Display the CLI menu and handle user inputs.
        """
        # Find max option and description length for alignment
        key_width = 2
        desc_width = max(len(value["description"]) for value in self.actions.values()) + key_width + 2

        while True:
            os.system("clear")
            print("\n  {0:^{2}}\n  {1:^{2}}".format("LDAP Utility Menu", "-" * desc_width, desc_width))

            # Populate menu options
            for key, action in self.actions.items():
                print("  {0:>{1}}. {2}".format(key, key_width, action["description"]))

            # Get option
            option = raw_input("\n  Enter your option: ").strip()

            # Fetch and execute the corresponding action, or handle invalid input
            if option.lower() in ["q", "quit"]:
                self.connection_manager.exit_program()

            # Execute action
            if option in self.actions:
                self._execute_action(option)
            else:
                print("\n  Invalid option. Please try again.")
                raw_input("\n  Press [Enter] to continue...")

    def _get_menu_option(self, action):
        """
        Handles user input based on action requirements.

        Args:
            action (dict): The action definition containing prompt and required status.

        Returns:
            str: The user input or an empty string if not required.
        """
        # If filter_value is predefined, return it immediately
        if action.get("filter_value"):
            return action["filter_value"]

        # Handle interactive user input if a prompt is provided
        if not action.get("prompt"):
            return ""

        while True:
            user_input = raw_input(action["prompt"]).strip()

            if not user_input and action.get("required"):
                print("\n  Input is required. Please provide a value.")
                continue

            if user_input in ["m", "menu"]:
                self.display_menu()
                continue

            if user_input in ["q", "quit"]:
                self.connection_manager.exit_program()

            return user_input

    def _execute_action(self, option):
        """
        Execute the action corresponding to the selected menu option.

        Args:
            option (str): The menu option selected by the user.
        """
        action = self.actions.get(option)

        if action is None:
            print("\n  Invalid option. Please try again.")
            return
        elif action["command"] == "modify_records":
            modify_menu = LDAPModifyMenu(self.connection_manager, self.invoker)
            modify_menu.display_menu()
        else:
            # Handle user input if a prompt is specified
            user_input = self._get_menu_option(action)

            # Execute the command with arguments
            args = {"filter_value": user_input} if user_input else {}

            # Execute the corresponding command
            formatted_output = self.invoker.execute_command(action["command"], args)

            # Only prompt for save if using the menu
            if formatted_output:
                self._prompt_save_output(formatted_output, action["command"], user_input)
                self._prompt_after_results()

    def _prompt_after_results(self):
        """
        Prompt the user to return to menu after results

        Returns:
            None
        """
        while True:
            response = raw_input("\n  Press (m) to return or (q) to exit: ").strip().lower()
            if response == "m":
                return # Return to menu
            elif response == "q":
                self.connection_manager.exit_program()
            else:
                print("\n  Invalid input. Please enter 'm' or 'q'.")

    def _prompt_save_output(self, formatted_output, command_name, filter_value):
        """
        Prompts the user to save the output to a file.

        Args:
            formatted_output (str): The formatted string output to save.
            command_name (str): The name of the executed command.
            filter_value (str): The filter value used for query (if any).
        """
        save_output = raw_input("  Save output to file? (y/n): ").strip().lower()
        print("")
        if save_output == "y":
            # Construct filename dynamically
            basename = "_".join(command_name.split("_")[1:])  
            suffix = "_{0}".format(filter_value) if filter_value else ""
            filename = "/tmp/{0}{1}.out".format(basename, suffix)

            try:
                with open(filename, "w") as file:
                    file.write(formatted_output)
                print("  Output saved to {0}\n".format(filename))
            except Exception as e:
                print("  Failed to save output: {0}".format(str(e)))


MOD_MENU = OrderedDict([
            ("1", {"description": "Modify Auth", "command": "mod_auth", "prompt": "  Enter login: "}),
            ("2", {"description": "Modify User Info (People)", "command": "mod_people", "prompt": "  Enter login: "}),
            ("3", {"description": "Modify App User", "command": "mod_appusr", "prompt": ["  Enter login: ", "  Enter application: "]}),
            ("4", {"description": "Modify Registration", "command": "mod_regstr", "prompt": ["  Enter login: ", "  Enter application: "]}),
            ("5", {"description": "Modify Group", "command": "mod_group", "prompt": "  Enter group id: "}),
            ("6", {"description": "Modify Printer", "command": "mod_prntr", "prompt": "  Enter printer name: "}),
            ("7", {"description": "Modify Adapter", "command": "mod_adptr", "prompt": "  Enter adapter IP: "}),
            ("8", {"description": "Modify Adapter Type", "command": "mod_adptyp", "prompt": "  Enter adapter type: "}),
            ("9", {"description": "Modify Host", "command": "mod_host", "prompt": "  Enter server name: "}),
            ("10", {"description": "Modify SysConf", "command": "mod_sysconf"}),
            ("m", {"description": "Return",}),
            ("q", {"description": "Quit",}),
        ])

class LDAPModifyMenu:
    """
    A submenu for modifying LDAP records.
    """

    def __init__(self, connection_manager, command_invoker):
        self.connection_manager = connection_manager
        self.invoker = command_invoker

        self.actions = MOD_MENU

    def display_menu(self):
        """
        Display the CLI menu and handle user inputs.
        """
        # Find max option and description length for alignment
        desc_width = max(len(value["description"]) for value in self.actions.values()) + 4

        while True:
            os.system("clear")
            print("\n  {0:^{2}}\n  {1:^{2}}".format("LDAP Modify Menu", "-" * desc_width, desc_width))

            # Populate menu options
            for key, action in self.actions.items():
                print("  {0:>2}. {1}".format(key, action["description"]))

            # Get option
            option = raw_input("\n  Enter your option: ").strip()

            # Fetch and execute the corresponding action, or handle invalid input
            if option.lower() in ["q", "quit"]:
                self.connection_manager.exit_program()
            elif option.lower() in ["m", "menu"]:
                return

            if option in self.actions:
                self._execute_action(option)
            else:
                print("\n  Invalid option. Please try again.")
                raw_input("\n Press [Enter] to continue...")

    def _execute_action(self, option):
        """
        Executes the selected modify action
        """
        action = self.actions.get(option)
        if action is None:
            print("\n  Invalid option. Please try again.")
            return

        # Prompt for modify type
        if not action["command"] in ["mod_sysconf", "mod_regstr"]:
            mod_type = self._prompt_mod_type()
            if mod_type == "q":
                return

        else:
            mod_type = "m"

        user_input = ""

        if isinstance(action.get("prompt"), list):
            user_input = []
            print("")
            for prompt in action["prompt"]:
                value = raw_input("{0}".format(prompt)).strip()
                user_input.append(value)

        elif action.get("prompt", None):
            # Get filter value for record
            user_input = raw_input("\n{0}".format(action["prompt"])).strip()

        if not user_input and action.get("prompt", None):
            print("\n  A value is required.")
            sleep(1)
            return

        self.invoker.execute_command(action["command"], {"mod_type": mod_type, "filter_value": user_input})

    def _prompt_mod_type(self):
        """
        Prompts user for modification type to perform.
        """
        while True:
            user_input = raw_input("\n  (A)dd, (M)odify, (D)elete, or (Q)uit: ").strip().lower()
            if user_input in ["a", "m", "d", "q"]:
                return user_input
            print("\n  Invalid selection. Please choose A, M, D, or Q.")


def command_factory(service, method_name, output_handler=None, format_method_name=None, fetch_method_name=None,
        base_dn=None, dn_attr=None, post_op=None):
    """
    Creates a factory function to instantiate a Command
    with the correct service and output method.

    Args:
        service (object): The service instance to call.
        method_name (str): The name of the method to call on the service.
        output_handler (LDAPOutputHandler): Handles output operations.
        format_method_name (str): The name of the formatting method to invoke.
        fetch_method_name (str, optional): The name of the method to fetch the record.
        base_dn (str, optional): The base DN for fetching record.
        dn_attr (str, optional): The key attribute for modify DN.

    Returns:
        function: A function that creates the designated Command class.
    """
    # Map Non-Generic command classes
    command_map = {
        "app_admins_report": AppAdminsCommand,
        "backup_ldap": LDAPShellCommand,
        "restore_ldap": LDAPShellCommand,
        "test_ldap": LDAPShellCommand,
        "test_ldap_repl": LDAPShellCommand,
        "mod_auth": LDAPModifyCommand,
        "mod_people": LDAPModifyCommand,
        "mod_prntr": LDAPModifyCommand,
        "mod_adptr": LDAPModifyCommand,
        "mod_adptyp": LDAPModifyCommand,
        "mod_host": LDAPModifyCommand,
        "mod_appusr": LDAPModifyCommand,
        "mod_group": LDAPModifyCommand,
        "mod_regstr": LDAPModifyCommand,
        "mod_sysconf": LDAPModifyCommand,
    }

    # Default to GenericCommand
    command_class = command_map.get(method_name, GenericCommand)

    def command_creator(**kwargs):
        if command_class is LDAPShellCommand:
            return command_class(service, method_name, **kwargs)
        elif command_class is LDAPModifyCommand:
            return command_class(service, method_name, output_handler, format_method_name, fetch_method_name, base_dn,
                    dn_attr, post_op, **kwargs)
        else:
            return command_class(
                service=service,
                method_name=method_name,
                output_handler=output_handler,
                format_method_name=format_method_name,
                fetch_method_name=fetch_method_name,
                **kwargs
            )
    return command_creator


def main():
    """
    Main entry point for the LDAP CLI utility.

    - Initializes components like configuration manager, connection manager, and services.
    - Registers commands with the CommandInvoker using a mapping.
    - Starts the CLI or menu interface.

    Returns:
        None
    """
    # Step 1: Initialize core components
    connection_manager = LDAPConnectionManager(
        ldap_url="ldaps://localhost",
    )
    fetcher = LDAPFetcher(connection_manager)
    modifier = LDAPModifier(fetcher)
    shell_service = LDAPShellService()
    output_handler = LDAPOutputHandler()
    command_invoker = initialize_invoker(fetcher, modifier, shell_service, output_handler)

    # Step 2: Parse arguments
    parser = argparse.ArgumentParser(description="LDAP CLI Utility")
    parser.add_argument("-u", "--user", help="Get user details by login")
    parser.add_argument("-p", "--printer", nargs="?", const="all", help="Get printer details by name or ip")
    parser.add_argument("--adapter", nargs="?", const="all", help="Get adapter details by ip")
    parser.add_argument("-a", "--app-admin", action="store_true", help="Get App Admins")
    parser.add_argument("-c", "--counts", action="store_true", help="Get group and user counts")
    parser.add_argument("-r", "--registered", nargs="?", const="all", help="Get registration status by app for user")
    parser.add_argument("-w", "--web-admin", action="store_true", help="Get NTCSS Web Admins")
    parser.add_argument("-s", "--sysconf", action="store_true", help="Get SysConf Data")
    parser.add_argument("--host", nargs="?", const="all", help="Get host details by name, ip, or fqdn")
    parser.add_argument("-v", "--version", action="version", version="ldap_utils 1.0.0")
    args = parser.parse_args()

    # Step 3: Initialize CLI or Menu
    if any(vars(args).values()):
        ldap_cli = LDAPCLI(connection_manager, command_invoker)
        ldap_cli.run(args)
    else:
        ldap_menu = LDAPMenu(connection_manager, command_invoker)
        ldap_menu.display_menu()

if __name__ == "__main__":
    main()

