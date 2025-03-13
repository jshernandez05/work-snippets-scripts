DEFAULT_APPS = ["ntcss", "radm", "rsupply", "ommsng", "nalcomis", "pomsng"]
LDAP_URI = "ldaps://localhost"

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
    for app in default_apps:
        # Check if the group name matches the expected pattern (e.g., ntcss01)
        # Use PAM group 01 because we don't adjust ntcss base group
        # and if only base group exists we don't need to rebalance
        if any(
            gr.gr_name == '{app}01'.format(
                app=app
                ) for gr in group_records
            ):
            app_grps.append(basename)

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
        connection = ntcss_ldap.connect_to_ldap_server(LDAP_URI, *credentials)
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

# ldapmodify -x ${LDAP_SBO} ${LDAP_MHO} -D"${LDAP_RDN}" ${LDAP_PFO}${LDAP_INFO} << EOF
#dn: userLogin=ntcssii,${LDAP_AUTH}
#changetype: modify
#replace: principalName
#principalName: ${login}
#EOF


def ldap_get_printer(ldap_connection, printer):
    """
    Retrieve and print printer details by printer name or IP.

    Args:
        ldap_connection: A bound ldap connectiion
        printer (str): The printer name or IP address to search

    Returns:
        None
    """
    base_dn = "ou=PRINTER_TABLE,o=optimized"
    bind_dn = "cn=admin,o=optimized"
    search_filter = "(|(printerIP={0})(printerName={0}))".format(printer)
    results = ldap_connection._connection.search_s(base_dn, ldap.SCOPE_SUBTREE, search_filter)
    flat_results = ldap_connection._flatten_pam_objects(results)

    print("Printer {0} Results".format(printer))
    print("=" * 40)
    for attr, value in flat_results.items():
        print("{0}: {1}".format(attr, value))

    print("\n")


print("\n")
# 'printerName': 'B1478_RCU' 10.0.122.137
#printer = "B1478_RCU"
#base_dn = "ou=PRINTER_TABLE,o=optimized"
#bind_dn = "cn=admin,o=optimized"
#search_filter = "(|(printerIP={0})(printerName={0}))".format(printer)
#results = ldap_connection._connection.search_s(base_dn, ldap.SCOPE_SUBTREE, search_filter)
#flat_results = ldap_connection._flatten_pam_objects(results)
#print("\n")
#print(len(flat_results))
#for attr, value in flat_results.items():
#  print("{0}: {1}".format(attr, value))
#pprint(flat_results)
#print("\n")

printer = "10.0.122.137"
ldap_get_printer(ldap_connection, printer)


def ldap_get_user(ldap_connection, user_login):
    """
    Retrieve and print all user's details from AUTH, People, and APPUSER tables.

    Args:
        ldap_connection: A bound ldap connectiion
        user_login (str): The ntcss login for the user

    Returns:
        None
    """
    # Search all tables for userLogin or uid = user's login
    base_dn = "o=optimized"
    search_filter = "(&(objectClass=top)(|(userLogin={0})(uid={0})))".format(user_login)
    results = ldap_connection._connection.search_s(base_dn, ldap.SCOPE_SUBTREE, search_filter)

    for dn, entry in results:
        # Print table title
        print("{0}".format(dn.split(",")[1][3:].upper()))
        print("=" *40)
        # Print all details from table
        for attr, values in entry.items():
            print("  {0}: {1}".format(attr, ", ".join(values)))
        print("")


user = "flozada"
ldap_get_user(ldap_connection, user)


def ldap_get_user_registration(ldap_connection, user_login):
    """
    Retrieve and print all user's application registration status.

    Args:
        ldap_connection: A bound ldap connectiion
        user_login (str): The ntcss login for the user

    Returns:
        None
    """
    # Fetch application name and registration flag for user
    base_dn = "ou=APPUSER_TABLE,o=optimized"
    search_filter = "(userLogin={0})".format(user)
    reg_attrs = ["cssApplicationName", "cssAppRegistered"]
    results = ldap_connection._connection.search_s(base_dn, ldap.SCOPE_SUBTREE, search_filter, reg_attrs)

    # Print table title
    print("\n")
    print("App Registration ({0})".format(user))
    print("=" * 40)

    # Print registration status for each application
    for _, entry in results:
        app = "{0}:".format(entry["cssApplicationName"][0])
        # Convert flag ("0", "1") to boolean
        registered = "{0}".format(bool(int(entry["cssAppRegistered"][0])))
        print("  {0:<12} {1:<6}".format(app, registered))
    print("\n")


user = "flozada"
ldap_get_user_registration(ldap_connection, user)



def ldap_get_all_users_groups(user):
    """
    Retrieve and print all groups a user is assigned to.

    Args:
        user_login (str): The ntcss login for the user

    Returns:
        None
    """
    # Fetch all group info
    groups = grp.getgrall()

    # Iterate through group struct and return those with user membership
    users_groups = ["{0}".format(gr.gr_name) for gr in groups if user in gr.gr_mem]

    # Print table title
    print("Groups Membership ({0})".format(user))
    print("=" * 40)

    # Print user's groups
    for group in users_groups:
       print("  {0}".format(group))

    print("\n")

user = "flozada"
ldap_get_all_users_groups(user)

