import sys
import ldap
import ntcss_ldap
import ntcss_config
from pprint import pprint


DEFAULT_APPS = ["ntcss", "radm", "rsupply", "ommsng", "nalcomis", "pomsng"]
LDAP_URL = "ldaps://localhost"

def get_valid_app_groups(default_apps, group_records):
    """
    Get site specific PAM groups from the default PAM groups.

    Args:
        default_apps (list): A list of PAM group base names to check for valid groups.
        group_records (list): Cached result of `grp.getgrall()`.

    Returns:
        list: A list of valid PAM group base names that have associated groups.
    """
    app_grps = []
    # Check if the group name matches the expected pattern (e.g., ntcss01)
    # Use PAM group 01 because we don't adjust ntcss base group
    # and if only base group exists we don't need to rebalance
    app_grps.extend(
        app
        for app in default_apps
        if any(gr.gr_name == '{app}01'.format(app=app) for gr in group_records)
    )
    return app_grps


def get_ldap_connection():
    """
    Setup LDAP connection

    Args:  None

    returns:
        LdapUtility: a class instance with a connection to LDAP
    """
    try:
        credentials = ntcss_config.get_local_ldap_server_admin_credentials()
        connection = ntcss_ldap.connect_to_ldap_server(LDAP_URL, *credentials)
        return connection
    except Exception as e:
        print("ERROR: Failed to connect to LDAP server: {0}\n".format(str(e)))
        sys.exit(1)


ldap_connection = get_ldap_connection()
#ldap_connection.add_pam_group("nalcomis25", "1005")
print("Groups Before:")
group_info = ldap_connection.get_pam_group_info("nalcomis24")
pprint(group_info)
group_info = ldap_connection.get_pam_group_info("nalcomis25")
pprint(group_info)
print("")

def modify_multiple_pam_groups_async(ldap_connection, attribute, moddict):
    """
    Perform asynchronous LDAP modifications for multiple groups.

    Args:
        ldap_connection: The LDAP connection object used to perform operations.
        attribute (str): The LDAP attribute to modify (e.g., "memberUid").
        moddict (dict): A dictionary where:
            - Keys are group categories (e.g., "group1", "group2").
            - Values are dictionaries with group names as keys and
              lists of new attribute values as values.

    Returns:
        dict: A report with "success" (list of successfully modified groups)
              and "failed" (list of groups with errors).
    """

    mod_report = {"success": [], "failed": []}
    message_ids = {}  # Map message_id to group_dn
    mod_action = ldap.MOD_REPLACE

    # Initiate all modify operations asynchronously
    for groups in moddict.values():
        for group, values in groups.items():
            modify_dn = "cn={0},ou=Groups,o=optimized".format(group)

            # Create the list of attributes to modify
            attrs = [(mod_action, attribute, values)]

            try:
                # Bind as the user
                ldap_connection._upgrade_to_user_bind()

                # Start the modify operation
                msgid = ldap_connection._connection.modify(modify_dn, attrs)

                # Map the message ID to the group DN for tracking
                message_ids[msgid] = modify_dn
            except Exception as e:
                # Log failure during the initiation phase
                mod_report["failed"].append((modify_dn, str(e)))

    # Collect results for all asynchronous operations
    collect_results(ldap_connection, message_ids, mod_report)

    return mod_report


def delete_multiple_pam_groups_async(ldap_connection, groups):
    """
    Perform asynchronous LDAP deletions for multiple groups.

    Args:
        ldap_connection: The LDAP connection object used to perform operations.
        groups (list): A list of group names to delete.

    Returns:
        dict: A report with "success" (list of successfully deleted groups)
              and "failed" (list of groups with errors).
    """
    delete_report = {"success": [], "failed": []}
    message_ids = {}  # Map message_id to group_dn

    for group in groups:
        delete_dn = "cn={0},ou=Groups,o=optimized".format(group)

        try:
            # Bind as the user
            ldap_connection._upgrade_to_user_bind()

            # Delete the group
            msgid = ldap_connection._connection.delete(delete_dn)

            # Map the mesage ID to the group DN for tracking
            message_ids[msgid] = delete_dn
        except ldap.LDAPError as e:
            # Log failure during the initiation phase
            delete_report["failed"].append((delete_dn, str(e)))

    # Collect results for all asynchronous operations
    collect_results(ldap_connection, message_ids, delete_report)

    return delete_report


def collect_results(ldap_connection, msg_dict, report):
    """
    Collect the results of asynchronous LDAP operations.

    Args:
        ldap_connection: The LDAP connection object used to collect results.
        msg_dict (dict): A dictionary mapping message IDs to distinguished names (DNs).
        report (dict): The report dictionary to update with success and failure results.

    Returns:
        dict: The updated report with "success" and "failed" entries.
    """
    for msgid, dn in msg_dict.items():
        try:
            # Wait for the result of each async operation
            result_type, result_data = ldap_connection._connection.result(msgid, all=1, timeout=10)
            report["success"].append(dn.split(",")[0])
        except ldap.TIMEOUT:
            # Log timeout failures
            report["failed"].append((dn.split(",")[0], "Timeout while waiting for result"))
        except Exception as e:
            # Log other failures during result collection
            report["failed"].append((dn.split(",")[0], str(e)))

    return report


def print_status_report(report, action):
    """
    Print a status report for LDAP operations.

    Args:
        report (dict): A dictionary with "success" and "failed" entries.
        action (str): The action performed (e.g., "modify" or "delete").
    """
    all_str = "all" if not report["failed"] else ""
    msg_action = {
        "modify": "update",
        "delete": "delete",
    }
    # Print success groups followed by failed groups
    if report.get("success"):
        print("\nSuccessfully {0}d {1} groups:".format(msg_action[action], all_str))
        for group in report["success"]:
            print("  - {0}".format(group))

    if report.get("failed"):
        print("\nFailed {0}s:".format(msg_action[action]))
        for group, error in report["failed"]:
            print("  - {0}: {1}".format(group, error))

    print("")


balanced_groups = {"nalcomis": {"nalcomis26": [], "nalcomis25": ["tuckerw"], "nalcomis24": ['wd3729', 'wl9424', 'ag1603']}}

update_report = modify_multiple_pam_groups_async(ldap_connection, "memberUid", balanced_groups)

empty_groups = ["nalcomis26"]
delete_report = delete_multiple_pam_groups_async(ldap_connection, empty_groups)
print_status_report(update_report, "modify")
print_status_report(delete_report, "delete")
print("Groups After:")
group_info = ldap_connection.get_pam_group_info("nalcomis24")
pprint(group_info)
group_info = ldap_connection.get_pam_group_info("nalcomis25")
pprint(group_info)


# LDAP_BM=simple
# LDAP_SUFFIX="o=optimized"
# LDAP_HOST="ou=HOSTS_TABLE,o=optimized"
# LDAP_AUTH="ou=AUTH_TABLE,o=optimized"
# LDAP_APP="ou=APPS_TABLE,o=optimized"
# LDAP_APPUSR="ou=APPUSER_TABLE,o=optimized"
# LDAP_ADPTR="ou=ADAPTER_TABLE,o=optimized"
# LDAP_ADPTR_TYPE="ou=ADAPTER_TYPE_TABLE,o=optimized"
# LDAP_PRNTR="ou=PRINTER_TABLE,o=optimized"
# LDAP_SYSCONF="ou=SYSCONF_TABLE,o=optimized"
# LDAP_USER="ou=People,o=optimized"
# LDAP_GROUP="ou=Groups,o=optimized"
# LDAP_SHADOW="ou=People,o=optimized"
# LDAP_INFO=/h/NTCSSS/ldap/runtime/SysInfoFile
# LDAP_PORT=${LDAP_PORT:-636}
# LDAP_PORT_S=636
# LDAP_RDN="cn=admin,o=optimized"
# LDAP_SBO="-x"
# LDAP_PFO="-y"
# LDAP_RCO="-LLL"
# LDAP_TLS="-ZZ"
# LDAP_LHO="-H ldaps://${LDAP_SRV}"
# LDAP_MHO="-H ldaps://${LDAP_MSTR_SRV}"
# ldapsearch -x -LLL -H ldaps://localhost -b"ou=APPUSER_TABLE,o=optimized -Dcn=admin,o=optimized -y/h/NTCSSS/ldap/runtime/SysInfoFile
#   "(cssApplicationName=NTCSS)"
base_dn = "ou=APPUSER_TABLE,o=optimized"
bind_dn = "cn=admin,o=optimized"
search_filter = "(&(cssApplicationName=NALCOMIS)(|(cssAppRole=4)(cssAppRole=12)(cssAppRole=28)))"
results = ldap_connection._connection.search_s(base_dn, ldap.SCOPE_SUBTREE, search_filter, ["userLogin", "cssAppRole"])
flat_results = ldap_connection._flatten_pam_objects(results)
print("\n")
print(len(flat_results))
pprint(flat_results)
print("\n")



def ldap_get_app_admins(ldap_connection):
    """
    Match userLogin from APPUSER_TABLE with AUTH_TABLE to get full names.

    Returns:
        dict: A dictionary mapping userLogin to fullName.
    """
    try:
        # Initialize and bind to the LDAP server
        connection = ldap_connection
        #connection.simple_bind_s(BIND_DN, BIND_PASSWORD)

        # Step 1: Get userLogins from APPUSER_TABLE
        appuser_filter = "(|(cssAppRole=4)(cssAppRole=12)(cssAppRole=28))"
        appuser_attributes = ["userLogin", "cssApplicationName"]
        appuser_results = connection.search_s(
            base_dn,
            ldap.SCOPE_SUBTREE,
            appuser_filter,
            appuser_attributes
        )

        # Group logins by application
        app_admins = {}
        for entry in appuser_results:
            if "userLogin" in entry[1] and "cssApplicationName" in entry[1]:
                user_login = entry[1]["userLogin"][0]
                app_name = entry[1]["cssApplicationName"][0]
            if app_name not in app_admins:
                app_admins[app_name] = []

            app_admins[app_name].append(user_login)


        # Step 2: Get user details from AUTH_TABLE
        #user_fullnames = {}
        user_details_by_app = {}
        for app_name, user_logins in app_admins.items():
            user_details_by_app[app_name] = []
            for user_login in user_logins:
                auth_filter = "(userLogin={0})".format(user_login)
                auth_attributes = ["ntcssUserName", "principalName", "emailAddr", "ntcssUserPhone"]
                auth_results = connection.search_s(
                    "ou=AUTH_TABLE,o=optimized",
                    ldap.SCOPE_SUBTREE,
                    auth_filter,
                    auth_attributes
                )

                # Map userLogin to fullName if found
                if auth_results:
                    dn, attributes = auth_results[0]
                    full_name = attributes.get("ntcssUserName", ["N/A"])[0]
                    windows_login = attributes.get("principalName", ["N/A"])[0]
                    email =  attributes.get("emailAddr", ["N/A"])[0]
                    phone =  attributes.get("ntcssUserPhone", ["N/A"])[0]
                    user_details_by_app[app_name].append((user_login, full_name, windows_login, email, phone))

        # Unbind the connection
        connection.unbind_s()

        return user_details_by_app

    except ldap.LDAPError as e:
        print("LDAP operation failed: {0}".format(e))
        return None

def main():  # sourcery skip: use-named-expression

    app_admins_by_app = ldap_get_app_admins(ldap_connection._connection)
    if app_admins_by_app:
        for app_name, user_details in app_admins_by_app.items():
            print("{0} APP ADMINS ({1})".format(app_name, len(user_details)))
            print("=" * 115)
            print("{0:<12} | {1:<20} | {2:<25} | {3:<25} | {4:<15}".format("ntcssLogin", "fullName", "winLogin", "email", "phone"))
            print("=" * 115)

            for user_login, full_name, windows, email, phone in user_details:
                #print("UserLogin: {0}, FullName: {1}".format(user_login, full_name))
                print("{0:<12} | {1:<20} | {2:<25} | {3:<25} | {4:<15}".format(user_login, full_name, windows, email, phone))
            print("\n")

ldap_connection._connection.unbind_s()
