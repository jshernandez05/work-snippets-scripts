#!/usr/bin/python
import sys
import ldap
import ntcss_ldap
import ntcss_config


LDAP_URL = "ldaps://localhost"
LDAP_MEMBER_ATTR = "memberUid"


def get_all_groups(ldap_connection):
    """
    Retrieve all groups and their members for the specified PAM groups.

    Args:
        ldap_connection: The LDAP connection object used to perform operations.

    Returns:
        dict: A dictionary where each key is a base name, and each value is a dictionary
            mapping group names to their member lists.
    """

    # Create a map for gid to application name
    gid_map = {
        "1001": "ntcss",
        "1002": "rsupply",
        "1003": "ommsng",
        "1004": "radm",
        "1005": "nalcomis",
        "1006": "pomsng",
    }

    # Fetch all group info
    base_dn = "ou=Groups,o=optimized"
    search_filter = "(objectClass=*)"
    reg_attrs = ["cn", "gidNumber", "memberUid"]
    results = ldap_connection._connection.search_s(base_dn, ldap.SCOPE_SUBTREE, search_filter, reg_attrs)

    # Initialize dictionary to store application groups data
    group_dict = {}

    # Extract group name, gid, and members from each entry
    for dn, entry in results:
        group = entry.get("cn", [None])[0]
        gid = entry.get("gidNumber", [None])[0]
        members = entry.get("memberUid", [])

	# Only use gid of NTCSS Applications
        if gid in gid_map:
            gid_key = gid_map.get(gid)
        else:
            continue

	# Add application name as dict key if not already present
        if gid_key not in group_dict:
            group_dict[gid_key] = {}

	# Add dict with group name as keys and members as values
        group_dict[gid_key][group] = members

    return group_dict


def get_group_counts(groups_data):
    """
    Print and return the total number of groups and users.

    Args:
        groups_data (dict): A dictionary of groups and their members.

    Returns:
        tuple: A tuple containing the total group count and total user count.
    """
    # Initialize variables to track total groups and users
    total_group_ct = 0
    total_user_ct = 0

    for app, groups in groups_data.items():
        group_ct = len(groups)  # Number of groups for individual app
        user_ct = sum(len(members) for members in groups.values())  # Total users in all groups for individual app
        total_group_ct += group_ct
        print("Found {group_ct} {group} group{s} with {user_ct} total users".format(
            group_ct=group_ct,
            group=app,
            s="" if group_ct == 1 else "s", # Pluralize string output
            user_ct=user_ct
            )
        )
        total_user_ct += user_ct

    print("\nTotal Users:  {total_user_ct}\nTotal Groups:  {total_group_ct}\n".format(
        total_user_ct=total_user_ct,
        total_group_ct=total_group_ct
        )
    )

    return total_group_ct, total_user_ct


def balance_groups(groups_data, max_users=50):
    """
    Rebalances users across groups ensuring no group exceeds the max_users

    Args:
        groups_data (dict): Dictionary with group names and their members.
        max_users (int): Max number of users allowed per group (default is 50)

    Returns:
        tuple: A tuple containing the updated groups_data and a list of movements (which users need to be moved).
    """

    # Initiate list to track user movements needed
    movements = []

    for group in groups_data.keys():
        # Sort group names by XX suffix
        group_names = sorted(groups_data[group].keys())

        # subtract 1 from len of groups to prevent next_group_index being out of bounds
        for i in range(len(group_names) -1):
            current_group = group_names[i]

            # Balance users from subsequent groups into the current group
            while len(groups_data[group][current_group]) < max_users:
                next_group_index = i + 1
                # Claculate how many users to move
                needed_users = max_users - len(groups_data[group][current_group])

                # Find next group with available users to move
                while next_group_index < len(group_names) and len(groups_data[group][group_names[next_group_index]]) == 0:
                    # Skip empty groups
                    next_group_index += 1

                if next_group_index >= len(group_names):
                    # No more groups
                    break

                next_group = group_names[next_group_index]
                available_users = len(groups_data[group][next_group])
                users_to_move = min(needed_users, available_users)

                # Move users from next group to current group
                moving_users = groups_data[group][next_group][:users_to_move:]
                groups_data[group][current_group].extend(moving_users)
                groups_data[group][next_group] = groups_data[group][next_group][users_to_move:]

                # Record movements
                movements.append({
                    "move_to_group": current_group,
                    "move_from_group": next_group,
                    "users_moved": moving_users
                })

                # Stop balancing if current group is full
                if len(groups_data[group][current_group]) >= max_users:
                    break

    return groups_data, movements


def print_user_movements(user_movements):
    """
    Display user movements in readable format.

    Args:
        user_movements (list[dict]): A list containing of dictionaries containing user movements.

    Return:
        None
    """
    print("\nUser Movements for LDAP group updates:\n")
    for movement in user_movements:
        print("\nMove the following users from {0} to {1}".format(movement["move_from_group"], movement["move_to_group"]))
        for user in movement["users_moved"]:
            print("  - {0}".format(user))

    print("")


def get_empty_groups(updated_groups):
    """
    Get a list of empty groups

    Args:
        balanced_groups list[dict]: A list of dictionaries containing groups and their members.

    Returns:
        list: A list of empty group names
    """
    # Initialize list to store empty group names
    empty_groups = []

    for groups in updated_groups.values():
        empty_groups.extend(
            group for group, users in list(groups.items()) if len(users) == 0
        )
    return empty_groups


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
    all_str = "" if report["failed"] else "all"
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


def get_ldap_connection():
    """
    Setup LDAP connection

    Args:  None

    returns:
        LdapUtility: a class instance with a connection to LDAP
    """
    try:
        credentials = ntcss_config.get_local_ldap_server_admin_credentials()
        return ntcss_ldap.connect_to_ldap_server(LDAP_URL, *credentials)
    except Exception as e:
        print("ERROR: Failed to connect to LDAP server: {0}\n".format(str(e)))
        sys.exit(1)


def main():
    print("\nStarting LDAP PAM Group Rebalance....\n")

    # Initiate LDAP connection for updating and deleting PAM groups and ensure clenaup
    try:
        ldap_connection = get_ldap_connection()

        # Get all PAM groups and their users
        groups_data = get_all_groups(ldap_connection)

        if not groups_data:
            print("ERROR: No groups or member data found in the system.\n")
            sys.exit(1)

        # Get rebalanced groups and list of users to move in LDAP
        balanced_groups, user_movements = balance_groups(groups_data)

        if not user_movements:
            print("\nAll groups are currently balanced.")
            updated_groups = balanced_groups
        else:
            # Output user movements for LDAP updates
            print_user_movements(user_movements)

            # Update LDAP
            update_report = modify_multiple_pam_groups_async(ldap_connection, LDAP_MEMBER_ATTR, balanced_groups)

            # Display LDAP update status
            print_status_report(update_report, "modify")

            # Get groups data after LDAP update
            updated_groups = get_all_groups(ldap_connection)

        # Delete groups with zero users
        empty_groups = get_empty_groups(updated_groups)

        if not empty_groups:
            print("\nNo empty groups found.\n")
        else:
            # Sort group numbers
            empty_groups = sorted(empty_groups)
            print("\nThe following groups are empty:  \n")
            print("\n".join(empty_groups) + "\n")

            # Update LDAP
            delete_report = delete_multiple_pam_groups_async(ldap_connection, empty_groups)

            # Display Group delete status
            print_status_report(delete_report, "delete")

            # Get group data after LDAP group delete
            updated_groups = get_all_groups(ldap_connection)

        # Print before counts and store values for comparison
        print("\nGroup Counts Before")
        print("===================")
        group_ct_before, _ = get_group_counts(groups_data)

        # Print after counts and store values for comparison
        print("\nGroup Counts After")
        print("==================")
        group_ct_after, _ = get_group_counts(updated_groups)

        print("Total Groups Cleaned:  {0}".format(group_ct_before - group_ct_after))

    finally:
    # Close LDAP connection
        if ldap_connection:
            ldap_connection._connection.unbind_s()


if __name__ == "__main__":
    main()