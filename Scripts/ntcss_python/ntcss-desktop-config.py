#!/usr/bin/python
"""
ntcss-desktop-server driver script
"""
import logging
import os
import shutil
import sys

import ntcss_config
import ntcss_desktop
import ntcss_ldap
import ntcss_shell
import ntcss_template


def configure_force_master_environment(ldap_connection):
    """
    """

    # get the template variables
    env =  ntcss_config.get_template_variables()

    # create the configuration utility class instances
    sys_config_util = ntcss_desktop.SystemConfiguration(ldap_connection)
    user_config_util = ntcss_desktop.UserConfiguration(ldap_connection)

    # create the ldap structure
    sys_config_util.create_ldap_structure()

    #
    # Create the pam groups (gids are automatically assigned starting at 1000)
    #

    # specifically create the sybase group to have gid 1000 to line up with
    # entry in /etc/group
    ldap_connection.add_pam_group('sybase', '1000')
    ldap_connection.add_pam_group('ntcss', '1001')

    pam_groups = ['rsupply', 'ommsng', 'radm', 'nalcomis']

    for group in pam_groups:
        ldap_connection.add_pam_group(group)

    #
    # Ensure that the sysconf settings exist
    #

    sys_config_util.create_sysconf_entries()

    #
    # Create the printer adapter types
    #

    printer_adapters = ['Generic', 'JetDirect', 'Lantronix', 'Microplex200',
        'Microplex202', 'PrintServer']

    for adapter in printer_adapters:
        sys_config_util.create_printer_adapter_type(adapter)

    #
    # Create the various NTCSS application groups
    #

    application_groups = ['NALCOMIS', 'NTCSS', 'OMMSNG', 'RADM', 'RSUPPLY']

    for group in application_groups:
        sys_config_util.create_app_group(group)

    #
    # Add the NTCSS host entries
    #

    sys_config_util.create_master_host(env['master_server_fqdn'],
        env['master_server_ip_address'])

    sys_config_util.create_slave_host(env['slave_server_fqdn'],
        env['slave_server_ip_address'])

    #
    # Create the necessary ntcss service accounts and user profiles.
    #

    user_accounts = ['ntcssii', 'supbtusr', 'omsbtusr', 'admbtusr',
        'imabtusr', 'sybbtusr', 'ssabtusr']

    for user in user_accounts:

        # the default auth server is the master
        auth_server = ntcss_ldap.MASTER_AUTH_SERVER

        # if this is primarily a slave account
        if user in ['imabtusr']:

            # create the user with the slave as the auth server
            auth_server = ntcss_ldap.SLAVE_AUTH_SERVER

        # create the user
        user_config_util.create_ntcss_service_account(user, auth_server)

        # create the user profile
        user_config_util.create_ntcss_user_profile(user)

    #
    # Grant application permission to NTCSS users
    #

    # set the 'admbtusr' permissions
    user_config_util.add_app_permissions_to_user('admbtusr', 'RADM',
        ntcss_config.NTCSS_APP_ROLE_INDEX['BATCH_USER_ROLE'])

    # set the 'imabtusr' permissions
    user_config_util.add_app_permissions_to_user('imabtusr', 'NALCOMIS',
        ntcss_config.NTCSS_APP_ROLE_INDEX['BATCH_USER_ROLE'])

    # set the 'ntcssii' user permissions
    user_config_util.add_app_permissions_to_user('ntcssii', 'NTCSS',
        ntcss_config.NTCSS_APP_ROLE_INDEX['APP_ADMIN_ROLE'])

    # set the 'omsbtusr' permissions
    user_config_util.add_app_permissions_to_user('omsbtusr', 'OMMSNG',
        ntcss_config.NTCSS_APP_ROLE_INDEX['BATCH_USER_ROLE'])

    # set the 'supbtusr' permissions
    user_config_util.add_app_permissions_to_user('supbtusr', 'RSUPPLY',
        ntcss_config.NTCSS_APP_ROLE_INDEX['BATCH_USER_ROLE'])

    #
    # Add pam users to additional pam groups (for paxferd, etc...)
    #

    # add the 'imabtusr' to other groups...
    ldap_connection.add_pam_user_to_pam_group('imabtusr', 'rsupply')

    # add the 'omsbtusr' to other groups...
    ldap_connection.add_pam_user_to_pam_group('omsbtusr', 'nalcomis')
    ldap_connection.add_pam_user_to_pam_group('omsbtusr', 'rsupply')

    # add the 'supbtusr' to other groups...
    ldap_connection.add_pam_user_to_pam_group('supbtusr', 'nalcomis')


def configure_force_slave_environment(ldap_connection):
    """
    """

    # create the configuration utility class instances
    user_config_util = ntcss_desktop.UserConfiguration(ldap_connection)

    #
    # Create the necessary ntcss account user profiles
    #

    user_accounts = ['ntcssii', 'supbtusr', 'omsbtusr', 'admbtusr',
        'imabtusr', 'sybbtusr', 'ssabtusr']

    # for every user account...
    for user in user_accounts:

        # create the user profile
        user_config_util.create_ntcss_user_profile(user)


def configure_unit_environment(ldap_connection):
    """
    """

    # get the template variables
    env =  ntcss_config.get_template_variables()

    # create the configuration utility class instances
    sys_config_util = ntcss_desktop.SystemConfiguration(ldap_connection)
    user_config_util = ntcss_desktop.UserConfiguration(ldap_connection)

    # create the ldap structure
    sys_config_util.create_ldap_structure()

    #
    # Create the pam groups (gids are automatically assigned starting at 1000)
    #

    # specifically create the sybase group to have gid 1000 to line up with
    # entry in /etc/group
    ldap_connection.add_pam_group('sybase', '1000')
    ldap_connection.add_pam_group('ntcss', '1001')

    pam_groups = ['rsupply', 'ommsng', 'radm']

    for group in pam_groups:
        ldap_connection.add_pam_group(group)

    #
    # Ensure that the sysconf settings exist
    #

    sys_config_util.create_sysconf_entries()

    #
    # Create the printer adapter types
    #

    printer_adapters = ['Generic', 'JetDirect', 'Lantronix', 'Microplex200',
        'Microplex202', 'PrintServer']

    for adapter in printer_adapters:
        sys_config_util.create_printer_adapter_type(adapter)

    #
    # Create the various NTCSS application groups
    #

    application_groups = ['NTCSS', 'OMMSNG', 'RADM', 'RSUPPLY']

    for group in application_groups:
        sys_config_util.create_app_group(group)

    #
    # Add the NTCSS host entries
    #

    sys_config_util.create_master_host(env['master_server_fqdn'],
        env['master_server_ip_address'])

    #
    # Create the necessary ntcss service accounts and user profiles.
    #

    user_accounts = ['ntcssii', 'supbtusr', 'omsbtusr', 'admbtusr',
        'sybbtusr', 'ssabtusr']

    for user in user_accounts:

        # create the user
        user_config_util.create_ntcss_service_account(user,
            ntcss_ldap.MASTER_AUTH_SERVER)

        # create the user profile
        user_config_util.create_ntcss_user_profile(user)

    #
    # Grant application permission to NTCSS users
    #

    # set the 'admbtusr' permissions
    user_config_util.add_app_permissions_to_user('admbtusr', 'RADM',
        ntcss_config.NTCSS_APP_ROLE_INDEX['BATCH_USER_ROLE'])

    # set the 'ntcssii' user permissions
    user_config_util.add_app_permissions_to_user('ntcssii', 'NTCSS',
        ntcss_config.NTCSS_APP_ROLE_INDEX['APP_ADMIN_ROLE'])

    # set the 'omsbtusr' permissions
    user_config_util.add_app_permissions_to_user('omsbtusr', 'OMMSNG',
        ntcss_config.NTCSS_APP_ROLE_INDEX['BATCH_USER_ROLE'])

    # set the 'supbtusr' permissions
    user_config_util.add_app_permissions_to_user('supbtusr', 'RSUPPLY',
        ntcss_config.NTCSS_APP_ROLE_INDEX['BATCH_USER_ROLE'])


def configure_take_environment(ldap_connection):
    """
    """

    # get the template variables
    env =  ntcss_config.get_template_variables()

    # create the configuration utility class instances
    sys_config_util = ntcss_desktop.SystemConfiguration(ldap_connection)
    user_config_util = ntcss_desktop.UserConfiguration(ldap_connection)

    # create the ldap structure
    sys_config_util.create_ldap_structure()

    #
    # Create the pam groups (gids are automatically assigned starting at 1000)
    #

    # specifically create the sybase group to have gid 1000 to line up with
    # entry in /etc/group
    ldap_connection.add_pam_group('sybase', '1000')
    ldap_connection.add_pam_group('ntcss', '1001')

    pam_groups = ['rsupply']

    for group in pam_groups:
        ldap_connection.add_pam_group(group)

    #
    # Ensure that the sysconf settings exist
    #

    sys_config_util.create_sysconf_entries()

    #
    # Create the printer adapter types
    #

    printer_adapters = ['Generic', 'JetDirect', 'Lantronix', 'Microplex200',
        'Microplex202', 'PrintServer']

    for adapter in printer_adapters:
        sys_config_util.create_printer_adapter_type(adapter)

    #
    # Create the various NTCSS application groups
    #

    application_groups = ['NTCSS', 'RSUPPLY']

    for group in application_groups:
        sys_config_util.create_app_group(group)

    #
    # Add the NTCSS host entries
    #

    sys_config_util.create_master_host(env['master_server_fqdn'],
        env['master_server_ip_address'])

    #
    # Create the necessary ntcss service accounts and user profiles.
    #

    user_accounts = ['ntcssii', 'supbtusr', 'sybbtusr', 'ssabtusr']

    for user in user_accounts:

        # create the user
        user_config_util.create_ntcss_service_account(user,
            ntcss_ldap.MASTER_AUTH_SERVER)

        # create the user profile
        user_config_util.create_ntcss_user_profile(user)

    #
    # Grant application permission to NTCSS users
    #

    # set the 'ntcssii' user permissions
    user_config_util.add_app_permissions_to_user('ntcssii', 'NTCSS',
        ntcss_config.NTCSS_APP_ROLE_INDEX['APP_ADMIN_ROLE'])

    # set the 'supbtusr' permissions
    user_config_util.add_app_permissions_to_user('supbtusr', 'RSUPPLY',
        ntcss_config.NTCSS_APP_ROLE_INDEX['BATCH_USER_ROLE'])


def configure_poms_environment(ldap_connection):
    """
    """

    # get the template variables
    env =  ntcss_config.get_template_variables()

    # create the configuration utility class instances
    sys_config_util = ntcss_desktop.SystemConfiguration(ldap_connection)
    user_config_util = ntcss_desktop.UserConfiguration(ldap_connection)

    # create the ldap structure
    sys_config_util.create_ldap_structure()

    #
    # Create the pam groups (gids are automatically assigned starting at 1000)
    #

    # specifically create the sybase group to have gid 1000 to line up with
    # entry in /etc/group
    ldap_connection.add_pam_group('sybase', '1000')
    ldap_connection.add_pam_group('ntcss', '1001')

    pam_groups = ['pomsng']

    for group in pam_groups:
        ldap_connection.add_pam_group(group)

    #
    # Ensure that the sysconf settings exist
    #

    sys_config_util.create_sysconf_entries()

    #
    # Create the printer adapter types
    #

    printer_adapters = ['Generic', 'JetDirect', 'Lantronix', 'Microplex200',
        'Microplex202', 'PrintServer']

    for adapter in printer_adapters:
        sys_config_util.create_printer_adapter_type(adapter)

    #
    # Create the various NTCSS application groups
    #

    application_groups = ['NTCSS', 'POMSNG']

    for group in application_groups:
        sys_config_util.create_app_group(group)

    #
    # Add the NTCSS host entries
    #

    sys_config_util.create_master_host(env['master_server_fqdn'],
        env['master_server_ip_address'])

    #
    # Create the necessary ntcss service accounts and user profiles.
    #

    user_accounts = ['ntcssii', 'omsbtusr', 'sybbtusr', 'ssabtusr']

    for user in user_accounts:

        # create the user
        user_config_util.create_ntcss_service_account(user,
            ntcss_ldap.MASTER_AUTH_SERVER)

        # create the user profile
        user_config_util.create_ntcss_user_profile(user)

    #
    # Grant application permission to NTCSS users
    #

    # set the 'ntcssii' user permissions
    user_config_util.add_app_permissions_to_user('ntcssii', 'NTCSS',
        ntcss_config.NTCSS_APP_ROLE_INDEX['APP_ADMIN_ROLE'])

    # set the 'omsbtusr' permissions
    user_config_util.add_app_permissions_to_user('omsbtusr', 'POMSNG',
        ntcss_config.NTCSS_APP_ROLE_INDEX['BATCH_USER_ROLE'])


def main(template_variables={}):

    #
    # Determine what type of suite we are configuring
    #

    suite_config = template_variables['ntcss_suite_configuration']


    #
    # Ensure LDAP is configured correctly
    #

    # match the configurations to the suite configuration
    configuration_functions = {

        # The default ldap configuration for Force environments
        'force-master': configure_force_master_environment,
        'force-slave': configure_force_slave_environment,

        # The MALS environment has the same ldap contents as the force
        'mals-force-master': configure_force_master_environment,
        'mals-force-slave': configure_force_slave_environment,

        # The NAS environment has the same ldap contents as the force
        'nas-force-master': configure_force_master_environment,
        'nas-force-slave': configure_force_slave_environment,

        # The default ldap configuration for Unit environments
        'unit': configure_unit_environment,

        # The default ldap configuration for T-AKE environments
        'take': configure_take_environment,

        # The default ldap configuration for POMS environments
        'poms': configure_poms_environment

    }

    # if we are on the master server...
    if ntcss_config.is_master_ntcss_server(template_variables):

        # get the local admin credentials for the ldap server
        credentials = ntcss_config.get_local_ldap_server_admin_credentials()

        # connect as an administrator
        ldap_connection = ntcss_ldap.connect_to_ldap_server(
            'ldaps://localhost', *credentials)

    # otherwise if we are on a slave server...
    else:

        # bind anonymously
        ldap_connection = ntcss_ldap.connect_to_ldap_server(
            'ldaps://localhost')

    # configure ldap and user accounts for the specified suite config
    configuration_functions[suite_config](ldap_connection)

    #
    # Initialize the template processor
    #

    template_processor = ntcss_template.TemplateProcessor(
        os.path.join('/usr/share/ntcss-desktop-server/templates/',
        suite_config), template_variables)

    #
    # Process all templates
    #
    template_processor.apply_all_templates()

    #
    # touch files that are empty at install and belong in /h/NTCSSS/database
    #
    db_touch_files = ('access_auth', 'adapters', 'ADMINPROCS', 'appusers',
                      'printers', 'progroups', 'ntprint.ini', 'printer_access',
                      'current_users', 'login_history')
    db_dir = '/h/NTCSSS/database'
    for file in db_touch_files:
         file_path = os.path.join(db_dir, file)

         ntcss_shell.touch_command(file_path)
         ntcss_shell.chown_command(file_path, 'ntcssii', 'ntcss')

         if file == 'ntprint.ini':
             ntcss_shell.chmod_command(file_path, '0644')
         else:
             ntcss_shell.chmod_command(file_path, '0600')

    # turn on the ntcss service
    ntcss_shell.execute("Turning on the 'ntcss' service.",
            ['/sbin/chkconfig', 'ntcss', 'on'])

    # restart xinetd
    ntcss_shell.service_command('xinetd', 'restart')


if __name__ == "__main__":

    # configure the root logger
    logger = ntcss_config.configure_root_logger()

    # get the template variables
    template_variables = ntcss_config.get_template_variables()

    # debug output to print the keys
    for key in sorted(template_variables.keys()):
        logger.debug("Loaded templated variable '{0}' = '{1}'".format(key,
            template_variables[key]))

    # start some baseline processing!
    main(template_variables)
