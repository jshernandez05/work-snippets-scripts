#!/usr/bin/python

import os
import sys
import ldap
import StringIO
import ntcss_ldap
import ntcss_config

import argparse


class LDAPHelper:
    """
    A utility class to interact with an LDAP server.

    Provides methods to query and retrieve information from the LDAP directory.

    Args:
        ldap_url (str): The LDAP server URL.
        bind_dn (str): The distinguished name (DN) to bind to the LDAP server.
        password (str): The password for the bind DN.

    Attributes:
        connection: The established LDAP connection.
    """

    APP_ADMIN_FILE = "/tmp/app_admin.rpt"


    def __init__(self, ldap_url=None, bind_dn=None, bind_password=None):
        """
        Initializes the LDAPHelper and sets up the connection.

        Args:
            ldap_url (str): The LDAP server URL.
            bind_dn (str): The distinguished name (DN) to bind to the LDAP server.
            bind_password (str): The password for the bind DN.

        Raises:
            Exception: If the connection or binding fails.
        """
        # If bind user is specified, store credentials
        self._bind_credentials = [bind_dn, bind_password] if bind_dn else None

        self.ldap_url = ldap_url
        self.bind_dn = bind_dn
        self.connection = self._setup_connection()
        self.org_dn = "o=optimized"
        self.auth_dn = "ou=AUTH_TABLE,o=optimized"
        self.appusr_dn = "ou=APPUSER_TABLE,o=optimized"
        self.printer_dn = "ou=PRINTER_TABLE,o=optimized"
        self.group_dn = "ou=Groups,o=optimized"
        self.adptr_dn = "ou=ADAPTER_TABLE,o=optimized"


    def _setup_connection(self):
        """
        Set up and return an LDAP connection.

        Returns:
            ldap.Connection: An established LDAP connection.

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
            raise Exception("Failed to connect to LDAP: {}".format(e))


    def _close_connection(self):
        """
        Close the LDAP connection.
        """
        if self.connection:
            try:
                print("\nClosing LDAP connection")
                self.connection._connection.unbind_s()
                self.connection._connection = None
            except Exception as e:
                print("\nWARNING: Failed to close LDAP connection: {0}".format(e))


    def exit_program(self):
        """
        Exit the program gracefully.

        Returns:
            None
        """
        self._close_connection()
        print("Exiting...")
        sys.exit(0)


    def query(self, search_filter, base_dn=None, attributes=None):
        """
        Execute an LDAP search and return the results.

        Args:
            search_filter (str): The LDAP search filter.
            base_dn (str, optional): The base DN for the search. Defaults to the instance's default_base_dn.
            attributes (list, optional): List of attributes to retrieve. Defaults to None (all attributes).

        Returns:
            list: A list of (dn, entry) tuples for each matching entry.
        """
        if base_dn is None:
            base_dn = self.org_dn

        try:
            return self.connection._connection.search_s(base_dn, ldap.SCOPE_SUBTREE, search_filter, attributes)
        except ldap.LDAPError as e:
            print("LDAP search failed: {0}".format(str(e)))
            return []


    def get_user_details(self, user_login, base_dn=None):
        """
        Retrieve and print all user's details from AUTH, People, and APPUSER tables.

        Args:
            base_dn (str): The starting point for the LDAP search
            user_login (str): The ntcss login for the user

        Returns:
            None
        """

        search_filter = "(&(objectClass=top)(|(userLogin={0})(uid={0})))".format(user_login)
        results = self.query(search_filter=search_filter)

        for dn, entry in results:
        # Print table title
            print("\n  {0}".format(dn.split(",")[1][3:].upper()))
            print("  " + "=" *40)
            # Print all details from table
            for attr, values in entry.items():
                print("  {0}: {1}".format(attr, ", ".join(values)))
        print("\n")


    def get_printer_details(self, printer, base_dn=None):
        """
        Retrieve and print printer details by printer name or IP.

        Args:
            base_dn (str): The starting point for the LDAP search
            printer (str): The printer name or IP address to search

        Returns:
            None
        """

        if base_dn is None:
            base_dn = self.printer_dn

        search_filter = "(|(printerIP={0})(printerName={0}))".format(printer)
        results = self.query(base_dn=base_dn, search_filter=search_filter)

        for _, entry in results:
            print("\n  Printer {0} Results".format(printer))
            print("  " + "=" * 40)
            for attr, value in entry.items():
                print("  {0}: {1}".format(attr, ", ".join(value)))

        print("\n")


    def get_registration_status(self, user_login, base_dn=None):
        """
        Retrieve and print all user's application registration status.

        Args:
            base_dn (str): The starting point for the LDAP search
            user_login (str): The ntcss login for the user

        Returns:
            None
        """

        if base_dn is None:
            base_dn = self.appusr_dn

        search_filter = "(userLogin={0})".format(user_login)
        reg_attrs = ["cssApplicationName", "cssAppRegistered"]
        results = self.query(base_dn=base_dn, search_filter=search_filter, attributes=reg_attrs)

        # Print table title
        print("\n")
        print("  App Registration ({0})".format(user_login))
        print("  " + "=" * 40)

        # Print registration status for each application
        for _, entry in results:
            app = "  {0}:".format(entry["cssApplicationName"][0])
            # Convert flag ("0", "1") to boolean
            registered = "{0}".format(bool(int(entry["cssAppRegistered"][0])))
            print("  {0}: {1}".format(app, registered))
        print("\n")


    def get_users_groups(self, user_login, base_dn=None):
        """
        Retrieve and print all groups a user is assigned to.

        Args:
            base_dn (str): The starting point for the LDAP search
            user_login (str): The ntcss login for the user

        Returns:
            None
        """

        if base_dn is None:
            base_dn = self.group_dn

        search_filter = "(memberUid={0})".format(user_login)
        grp_attrs = ["cn"]
        results = self.query(base_dn=base_dn, search_filter=search_filter, attributes=grp_attrs)

        # Print table title
        print("  Groups Membership ({0})".format(user_login))
        print("  " + "=" * 40)

        groups = sorted([entry["cn"] for _, entry in results if "cn" in entry])
        # Print users groups
        for group in groups:
            print("  {0}".format("".join(group)))
        print("\n")


    def get_all_ldap_groups(self, base_dn=None):
        """
        Retrieve and print all groups a user is assigned to.

        Args:
            base_dn (str): The starting point for the groups search

        Returns:
            None
        """

        gid_map = {
            "1001": "ntcss",
            "1002": "rsupply",
            "1003": "ommsng",
            "1004": "radm",
            "1005": "nalcomis",
            "1006": "pomsng",
        }

        # Fetch all group info
        if base_dn is None:
            base_dn = self.group_dn

        search_filter = "(objectClass=*)"
        grp_attrs = ["cn", "gidNumber", "memberUid"]
        results = self.query(base_dn=base_dn, search_filter=search_filter, attributes=grp_attrs)

        group_dict = {}

        for dn, entry in results:

            group = entry.get("cn", [None])[0]
            gid = entry.get("gidNumber", [None])[0]
            members = entry.get("memberUid", [])


            if gid in gid_map:
                gid_key = gid_map.get(gid)
            else:
                continue

            if gid_key not in group_dict:
                group_dict[gid_key] = {}

            group_dict[gid_key][group] = members

        return group_dict


    def get_group_counts(self, group_dict):
        """
        Print the total numbers of groups and users per application
        and print total distinct users.

        Args:
        group_dict (dict): A dictionary of groups and their members.

        Returns:
            None
        """

        total_group_ct = 0
        all_users = []

        # Print table title
        print("\n  Group and User counts")
        print(" " + "=" * 40)

        for app, groups in group_dict.items():
            group_ct = len(groups)
            user_ct = sum(len(members) for members in groups.values())
            total_group_ct += group_ct

            print("  Found {group_ct} {app} group{s} with {user_ct} total users".format(
                group_ct=group_ct,
                app=app,
                s="" if group_ct == 1 else "s", # Pluralize string output
                user_ct=user_ct
                )
            )
            all_users.extend([user for members in groups.values() for user in members])

        print("\n  Total Users:  {total_user_ct}\n  Total Groups:  {total_group_ct}\n".format(
            total_user_ct=len(set(all_users)),
            total_group_ct=total_group_ct
            )
        )


    def get_app_admins(self, appusr_dn=None, auth_dn=None):
        """
        Retrieve a list of users with app admin permissions by application.

        Args:
            appuser_dn (str): Starting point for the app user search
            auth_dn (str): Starting point for the auth user search

        Returns:
            dict: A dictionary mapping user and details to each application.
        """
        if appusr_dn is None:
            appusr_dn = self.appusr_dn
        try:
            # Step 1: Seart APPUSER_TABLE for users with cssAppRole of 4, 12, or 28
            app_attr = "cssApplicationName"
            role_attr = "cssAppRole"
            app_admin_roles = [4, 12, 20, 28]
            role_filter = "(|{0})".format("".join("({0}={1})".format(role_attr, role) for role in app_admin_roles))
            condition1 = "(&(!({0}=NTCSS)){1})".format(app_attr, role_filter)
            condition2 = "(&({0}=NTCSS)(!(userLogin=ntcssii)))".format(app_attr)
            full_filter = "(|{0}{1})".format(condition1, condition2)
            appuser_attributes = ["userLogin", "cssApplicationName"]
            appuser_results = self.query(
                base_dn=appusr_dn,
                search_filter=full_filter,
                attributes=appuser_attributes
            )

            # Step 2: Group logins by application
            app_admins = {}
            for entry in appuser_results:
                if "userLogin" in entry[1] and "cssApplicationName" in entry[1]:
                    user_login = entry[1]["userLogin"][0]
                    app_name = entry[1]["cssApplicationName"][0]

                # Initialize the list for the application if not already present
                if app_name not in app_admins:
                    app_admins[app_name] = []

                # Append the user login to the corresponding application group
                app_admins[app_name].append(user_login)

            # Step 3: Get user details from AUTH_TABLE for each userLogin
            if auth_dn is None:
                auth_dn = self.auth_dn

            user_details_by_app = {}
            for app_name, user_logins in app_admins.items():
                user_details_by_app[app_name] = [] # Initialize empty list for each app
                for user_login in user_logins:
                    # Search AUTH_TABLE for user's details
                    auth_filter = "(userLogin={0})".format(user_login)
                    auth_attributes = ["ntcssUserName", "principalName", "emailAddr", "ntcssUserPhone"]
                    auth_results = self.query(
                        base_dn=auth_dn,
                        search_filter=auth_filter,
                        attributes=auth_attributes
                    )

                    # Map user details if available
                    if auth_results:
                        _, attributes = auth_results[0]
                        full_name = attributes.get("ntcssUserName", ["N/A"])[0]
                        windows_login = attributes.get("principalName", ["N/A"])[0]
                        email =  attributes.get("emailAddr", ["N/A"])[0]
                        phone =  attributes.get("ntcssUserPhone", ["N/A"])[0]
                        user_details_by_app[app_name].append((user_login, full_name, windows_login, email, phone))

            return user_details_by_app

        except ldap.LDAPError as e:
            print("LDAP search failed: {0}".format(e))
            return None


    def _generate_app_admin_report_io(self, app_admins):
        """
        Generates report content using StringIO.StringIO for printing and file writing.

        Args:
            app_admins (dict): A dictionary with app names as keys and app admin details as values.

        Returns:
            StringIO.StringIO: An in-memory object containing the formatted report content.
        """
        # Initialize the buffer
        buffer = StringIO.StringIO()

        # Print intial line space and report header
        buffer.write("\n\n{0:^112}\n{1:^112}\n\n".format("APP ADMINISTRATOR REPORT", "=" * 24))

        # Header for each application
        for app_name, user_details in app_admins.items():
            buffer.write("{0} APP ADMINS ({1})\n".format(app_name, len(user_details)))
            buffer.write("=" * 112 + "\n")
            buffer.write("{0:<8} | {1:<25} | {2:<20} | {3:<30} | {4:<12}\n".format("login", "fullName", "winLogin", "email", "phone"))
            buffer.write("=" * 112 + "\n")

            for user_login, full_name, windows, email, phone in user_details:
            # Print each user's details in tabular form
                buffer.write("{0:<8} | {1:<25} | {2:<20} | {3:<30} | {4:<12}\n".format(user_login, full_name, windows, email, phone))

            # Add spacing between application headers
            buffer.write("\n\n")

        # Reset the buffer to the beginning for reading
        buffer.seek(0)

        return buffer


    def display_and_write_app_admin_report(self, app_admins, filename=APP_ADMIN_FILE):
        """
        Display app administrators for each application in tabular form.

        Args:
            app_admins (dict): A dictionary with app names as keys and app admin details as values.
            filename (str): The name of the output file (default: app_admin.rpt).

        Returns:
            None
        """
        # Generate the report content
        report_buffer = self._generate_app_admin_report_io(app_admins)

        # Display the report on screen
        print(report_buffer.read())

        # Reset the buffer for writing
        report_buffer.seek(0)

        # Write the report to file
        try:
            with open(filename, "w") as wf:
                wf.write(report_buffer.read())
            print("Report saved in {0}\n".format(filename))
        except Exception as e:
            print("Failed to write report to file: {0}".format(str(e)))


class LDAPCLI:
    """
    A command-line interface (CLI) class to handle user-provided arguments and trigger LDAP operations.

    Attributes:
        helper (LDAPHelper): An instance of LDAPHelper to perform LDAP operations.
    """

    def __init__(self, helper):
        """
        Initialize the LDAPCLI with an LDAPHelper instance.

        Args:
            ldap_helper (LDAPHelper): An instance of LDAPHelper to handle LDAP operations.
        """
        self.helper = helper


    def parse_args(self):
        """
        Parse command-line arguments provided by the user.

        Returns:
            Namespace: Parsed command-line arguments.
        """
        parser = argparse.ArgumentParser(description="LDAP CLI Utility")
        parser.add_argument("-u", "--user", help="Get user details by login")
        parser.add_argument("-p", "--printer", help="Get printer details by name or ip")
        parser.add_argument("-a", "--app-admins", action="store_true", help="Get app admins")
        parser.add_argument("-g", "--group-counts", action="store_true", help="Get group and user counts")
        return parser.parse_args()


    def run(self, args):
        """
        Execute the appropriate LDAPHelper function based on the parsed arguments.

        Args:
            args: Parsed command-line arguments.

        Returns:
            None
        """
        if args.user:
            self.helper.get_user_details(args.user)
        elif args.printer:
            self.helper.get_printer_details(args.printer)
        elif args.app_admins:
            app_admins = self.helper.get_app_admins()
            if app_admins:
                # Print and write report
                self.helper.display_and_write_app_admin_report(app_admins)
            else:
                print("\nNo application administrators found.")
        elif args.group_counts:
            groups_data = self.helper.get_all_ldap_groups()
            self.helper.get_group_counts(groups_data)
        else:
            LDAPMenu(self.helper).display_menu()


class LDAPMenu:
    """
    A CLI menu-based utility to interact with the LDAPHelper class.

    Attributes:
        helper (LDAPHelper): An instance of LDAPHelper to perform LDAP operations.
        actions (dict): A mapping of menu options to corresponding actions (functions).
    """

    def __init__(self, helper):
        """
        Initialize the LDAPMenu with an LDAPHelper instance.

        Args:
            helper (LDAPHelper): An instance of LDAPHelper to handle LDAP operations.
        """
        self.helper = helper
        self.actions = {
            "1": self.get_user_details,
            "2": self.get_app_admins,
            "3": self.get_group_counts,
            "4": self.get_printer_details,
            "5": self.helper.exit_program
        }


    def display_menu(self):
        """
        Display the CLI menu and handle user inputs.
        """
        while True:
            os.system("clear")
            print("\n LDAP Utility Menu")
            print(" -------------------")
            print("  1. Get User Details")
            print("  2. Get App Admins")
            print("  3. Get Group and User Counts")
            print("  4. Get Printer Details")
            print("  5. Exit")
            option = raw_input("\n  Enter your choice: ")

            # Fetch and execute the corresponding action, or handle invalid input
            action = self.actions.get(str(option), self.invalid_choice)
            action()
            self.prompt_after_results()


    def get_user_details(self):
        """
        Handle the menu option to fetch user details.

        Returns:
            None
        """
        user_login = raw_input("Enter user login: ")
        self.helper.get_user_details(user_login=user_login)


    def get_printer_details(self):
        """
        Handle the menu option to fetch printer details.

        Returns:
            None
        """
        printer = raw_input("Enter printer name or ip address: ")
        self.helper.get_printer_details(printer)


    def get_app_admins(self):
        """
        Handle the menu option to fetch application administrators.

        Returns:
            None
        """
        app_admins = self.helper.get_app_admins()
        self.helper.display_and_write_app_admin_report(app_admins)


    def get_group_counts(self):
        """
        Handle the menu option to fetch group and user counts.

        Returns:
            None
        """
        groups_data = self.helper.get_all_ldap_groups()
        self.helper.get_group_counts(groups_data)


    def invalid_choice(self):
        """
        Handle invalid menu choices.

        Returns:
            None
        """
        print("Invalid choice. Please try again.")


    def prompt_after_results(self):
        """
        Prompt the user to return to menu after results

        Returns:
            None
        """

        while True:
            response = raw_input("\nPress (m) to return or (q) to exit: ").strip().lower()
            if response == "m":
                return # Return to menu
            elif response == "q":
                self.helper.exit_program()
            else:
                print("\n  Invalid input. Please enter 'm' or 'q'.")


def main():
    """
    Main entry point for the LDAP CLI utility.

    - Initializes LDAPHelper and LDAPCLI.
    - Processes CLI arguments.

    Returns:
        None
    """
    # Initialize the LDAPHelper
    ldap_helper = LDAPHelper(
        ldap_url="ldaps://localhost",
    )

    # Initialize and run the CLI
    ldap_cli = LDAPCLI(ldap_helper)
    args = ldap_cli.parse_args()
    ldap_cli.run(args)


if __name__ == "__main__":
    main()
