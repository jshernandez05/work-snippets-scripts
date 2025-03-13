#!/usr/bin/python

import exceptions
import logging
import os
import re
import shutil
import sys
from itertools import chain

import ntcss_config
import ntcss_ldap
import ntcss_legacy_api
import ntcss_shell

# declare and initialize the logger instance for the module
logger = logging.getLogger('ntcss-logger')

class DesktopException(exceptions.Exception):
    """
    Standard exception thrown to capture ntcss_desktop errors.
    """
    pass


class UserConfiguration():
    """
    """

    def __init__(self, ldap_connection):
        self._ldap_connection = ldap_connection


    def create_ntcss_user_profile(self, pam_user, pam_group='ntcss'):
        """
        """

        #
        # create the user's home directory
        #

        # verify the user's home directory
        if pam_user == 'ntcssii':
            home_dir = '/h/USERS/ntcssii'
        else:
            # get the user's info from ldap
            user_info = self._ldap_connection.get_pam_user_info(pam_user)

            home_dir = user_info['homeDirectory']

        # create the user's home directory if it does not exist
        if not os.path.exists(home_dir):
            os.mkdir(home_dir)

        # forcibly chown and chmod the home directory
        ntcss_shell.chmod_command(home_dir, '0750')
        ntcss_shell.chown_command(home_dir, pam_user, pam_group)

        #
        # add the user configuration files, note that these will be installed with
        # the system-config-baseline rpm.
        #
        config_dir = '/usr/share/system-config-baseline/user-config-files/'

        for file in ('.cshrc', '.login', '.mailrc', '.profile'):

            # ignore the file if it already exists in the user's home directory
            if os.path.exists(os.path.join(home_dir, file)):
                continue

            # copy the base file into the home dir
            shutil.copy(os.path.join(config_dir, file), home_dir)

            # set the permissions on the file
            ntcss_shell.chmod_command(os.path.join(home_dir, file), '0750')

            # make the defualt ownership pam_user:ntcss
            ntcss_shell.chown_command(os.path.join(home_dir, file), pam_user,
                'ntcss')

        #TODO: Very odd. need to change the group ownership to root to match
        # the old installer. look to remove this.
        ntcss_shell.chown_command(os.path.join(home_dir, '.cshrc'), pam_user,
            'root')
        ntcss_shell.chown_command(os.path.join(home_dir, '.login'), pam_user,
            'root')

        #
        # Create the user's mail files
        #

        # create the user's home directory if it does not exist
        mail_file = os.path.join('/var/spool/mail', pam_user)

        # create the user mail file if it does not exist
        if not os.path.exists(mail_file):
            ntcss_shell.touch_command(mail_file)

        # forcibly chown and chmod the mail file
        ntcss_shell.chown_command(mail_file, pam_user, 'mail')
        ntcss_shell.chmod_command(mail_file, '0660')

        #
        # Create the ntcss user message board lock file
        #

        # create the meesage directory if it does not exist
        message_dir = os.path.join('/h/NTCSSS/message/', pam_user)

        if not os.path.exists(message_dir):
            os.mkdir(message_dir)

        # create the lock file if it does not exist
        lock_file = os.path.join(message_dir, 'lock_file')

        if not os.path.exists(lock_file):
            ntcss_shell.touch_command(lock_file)

        ntcss_shell.chown_command(message_dir, pam_user, 'ntcss', recursive=True)
        ntcss_shell.chmod_command(message_dir, '0775')
        ntcss_shell.chmod_command(lock_file, '0640')

        #
        # Delete the user and group cache files, this is required so that ldap
        # updates get propagated to the caches used by the userconfig client app
        #

        # delete the user cache
        uc_query_file = '/h/NTCSSS/logs/UC.query'
        if os.path.exists(uc_query_file):
            os.remove(uc_query_file)

        # TODO: delete the program group cache. Note this needs to be moved to a
        # function that does post app add processing
        pg_query_file = '/h/NTCSSS/logs/PG.query'
        if os.path.exists(pg_query_file):
            os.remove(pg_query_file)

        #
        # add the user bulletin board entry
        #
        self._add_bulletin_board_entry(pam_user)

        #
        # subscribe the user to NTCSS
        #
        self._add_subscriber_entry(pam_user, 'NTCSS')

    def _flat_file_entry_exists(self, file_name, entry):
        """
        """
        # read the bulletin board file
        with open(file_name, 'r') as file:

            # read each line
            for line in file:

                # if the line matches return successfully
                if re.match(entry, line):
                    return True

        return False

    def _add_bulletin_board_entry(self, board_name, is_system_bulletin_board=False):
        """
        """
        # determine and pad the board owner
        if is_system_bulletin_board:
            board_owner = "SYSTEM".ljust(8)
        else:
            board_owner = board_name.ljust(8)

        # create the board entry
        board_entry = "{0} {1}\n".format(board_owner, board_name)

        bb_file = '/h/NTCSSS/message/bul_brds'

        # if the entry does not exist
        if not self._flat_file_entry_exists(bb_file, board_entry):

            # open the file in append mode
            with open(bb_file, 'a') as file:

                # add the entry to the file
                file.write(board_entry)

    #
    # the /h/NTCSSS/message/subscribers filke contains these enrtis by defual in a
    # force configuration. They are not necessarilly in this order, and we will
    # probably want to have the list sorted before we compar the file we generate
    # in the new installer with the old one.
    #
    #
    # batch user entries:
    # -----------------------------
    # admbtusr NTCSS.all
    # admbtusr RADM.all
    # imabtusr NTCSS.all
    # imabtusr NALCOMIS.all
    # omsbtusr NTCSS.all
    # omsbtusr OMMSNG.all
    # supbtusr NTCSS.all
    # supbtusr RSUPPLY.all
    # ssabtusr NTCSS.all
    # sybbtusr NTCSS.all
    #
    # admin user entry:
    # ------------------------------------
    # ntcssii  NTCSS.all
    #

    def _add_subscriber_entry(self, pam_user, ntcss_app):
        """
        """
        subscriber_file = '/h/NTCSSS/message/subscribers'

        logger.info("Subscribing '{0}' user to '{1}' "
                    "application".format(pam_user, ntcss_app))

        try:
            # Verify app is a valid NTCSS application
            verified = ntcss_config.APP_PAM_GROUP_INDEX[ntcss_app]
        except KeyError:
            raise DesktopException("Cannot add subscriber entry for unknown "
                                   "application: '{0}'".format(ntcss_app))

        # determine what the entry should be
        entry = "{0} {1}.all\n".format(pam_user.ljust(8), ntcss_app)

        # if the entry does not exist add it
        if not self._flat_file_entry_exists(subscriber_file, entry):
            with open(subscriber_file, 'a') as file:
                file.write(entry)

    def add_subscriber_entry(self, pam_user, ntcss_app):
        """
        """
        #
        # subscribe the user to application ntcss_app
        #
        self._add_subscriber_entry(pam_user, ntcss_app)

    def create_ntcss_user_account(self, pam_user, pam_group='ntcss', **kwargs):
        """
        """
        logger.info("Creating the '{0}' NTCSS user.".format(pam_user))

        # create or validate the pam group
        group_info = self._ldap_connection.add_pam_group(pam_group)

        # create or validate the pam user
        if pam_user not in ['ntcssii', 'sybase']:
            self._ldap_connection.add_pam_user(pam_user,
                gid_number=group_info['gidNumber'])

        # add the user to the specified group
        self._ldap_connection.add_pam_user_to_pam_group(pam_user, pam_group)

        # attempt to generate the user password
        try:

            # generate the user's random database password
            database_password = ntcss_legacy_api.genpasswd()

            # encrypt the password
            encrypted_password = ntcss_legacy_api.triple_des_encrypt(
                ntcss_legacy_api.SHARED_SECRET, database_password)

            # add the user to the AUTH_TABLE in LDAP
            self._ldap_connection.add_ntcss_user(pam_user, encrypted_password,
                **kwargs)

        # the OSError will get raised when the NTCSS shared library does not
        # exist (e.g. at installation time of the ntcss rpm)
        except OSError:

            logger.warn("The NTCSS shared library could not be loaded.")
            logger.warn("The '{0}' user is being assigned the default database "
                "password, which will need to be changed.".format(pam_user))

            # add the user to the AUTH_TABLE in LDAP=]
            self._ldap_connection.add_ntcss_user(pam_user, 'Changeme',
                **kwargs)

    def dismantle_ntcss_user_account(self, pam_user):
        """
        """
        logger.info("Dismantling the '{0}' NTCSS user.".format(pam_user))

        # Delete user from ou=People
        self._ldap_connection.delete_pam_user(pam_user)

        # Remove user from all groups in ou=Groups table
        for pam_group in ntcss_config.APP_PAM_GROUP_INDEX.values():
            self._ldap_connection.delete_pam_user_from_pam_group(pam_user, pam_group)

        # Delete user from ou=AUTH table
        self._ldap_connection.delete_ntcss_user(pam_user)

        # Remove user from all apps in ou=APPUSER_TABLE table
        for app in ntcss_config.APP_PAM_GROUP_INDEX.keys():
            self._ldap_connection.delete_app_permissions_of_ntcss_user(app, pam_user)

    def create_ntcss_service_account(self, pam_user, authentication_server,
            pam_group='ntcss'):
        """
        """

        #
        # Set up all of the dictionaries with the values that need to be passed
        # in for the service account user creation
        #

        admbtusr_kwargs = { 'users_full_name': 'Batch User',
            'auth_pw_time': '000000.0000'
        }

        imabtusr_kwargs = { 'users_full_name': 'Batch User',
            'auth_pw_time': '000000.0000'
        }

        ntcssii_kwargs = { 'users_full_name': 'Base NTCSS User',
            'auth_pw_time': '000000.0000',
            'phone': 'Unknown'
        }

        omsbtusr_kwargs = { 'users_full_name': 'Batch User',
            'auth_pw_time': '000000.0000',
        }

        ssabtusr_kwargs = { 'users_full_name': 'Batch User',
            'auth_pw_time': '000000.0000',
        }

        supbtusr_kwargs = { 'users_full_name': 'Batch User',
            'auth_pw_time': '000000.0000',
        }

        sybbtusr_kwargs = { 'users_full_name': 'Batch User',
            'auth_pw_time': '000000.0000',
        }


        #
        # create the dictionary that ties the service account names to the
        # user creation kwargs
        #

        service_account_kwargs = { 'admbtusr': admbtusr_kwargs,
            'imabtusr': imabtusr_kwargs,
            'ntcssii': ntcssii_kwargs,
            'omsbtusr': omsbtusr_kwargs,
            'ssabtusr': ssabtusr_kwargs,
            'supbtusr': supbtusr_kwargs,
            'sybbtusr': sybbtusr_kwargs
        }

        #
        # create the specified user account
        #

        try:

            # get the kwargs for adding the user
            kwargs = service_account_kwargs[pam_user]

            # create the user
            self.create_ntcss_user_account(pam_user, pam_group=pam_group,
                auth_server_name=authentication_server, **kwargs)

        except KeyError:
            raise DesktopException("Cannot create the specified ntcss service "
                "account '{0}' because it is unknown.".format(pam_user))


    def add_app_permissions_to_user(self, pam_user, ntcss_app,
        app_role):
        """
        """
        logger.info("Adding '{0}' application permissions of '{1}' to "
            "the '{2}' NTCSS user".format(ntcss_app, app_role, pam_user))

        try:
            # Get the linux pam group associated with the NTCSS applicaiton
            app_pam_group = ntcss_config.APP_PAM_GROUP_INDEX[ntcss_app]
        except KeyError:
            raise DesktopException("Cannot add permissions for unknown "
                "application: '{0}'".format(ntcss_app))

        # create or validate the pam group
        group_info = self._ldap_connection.add_pam_group(app_pam_group)

        # add the user to the ntcss_app pam group
        self._ldap_connection.add_pam_user_to_pam_group(pam_user,
            app_pam_group)

        # Add app permission entry
        self._ldap_connection.add_app_permissions_to_ntcss_user(ntcss_app,
            pam_user, app_role=app_role)

        # Subscribe the user to the application
        self._add_subscriber_entry(pam_user, ntcss_app)



class SystemConfiguration():
    """
    """

    def __init__(self, ldap_connection):
        self._ldap_connection = ldap_connection

    def create_printer_adapter_type(self, adapter_type):

        #
        # Set up all of the dictionaries with the values that need to be passed
        # in for the printer adapter type creation
        #

        generic_params = { 'type': 'Generic',
            'ports': 'P1',
            'config_script': 'std_bootp_setup'
        }

        jet_direct_params = { 'type': 'JetDirect',
            'ports': 'P1',
            'config_script': 'std_bootp_setup'
        }

        lantronix_params = { 'type': 'Lantronix',
            'ports': 'P1 S1',
            'config_script': 'lantronix_setup'
        }

        microplex_200_params = { 'type': 'Microplex200',
            'ports': 'P1 S1',
            'config_script': 'microplex_setup'
        }

        microplex_202_params = { 'type': 'Microplex202',
            'ports': 'P1 P2 S1 S2',
            'config_script': 'microplex_setup'
        }

        print_server_params = { 'type': 'PrintServer',
            'ports': 'QueueName',
            'config_script': 'std_bootp_setup'
        }

        #
        # create the dictionary that ties the printer adapter type creation
        # parameters to the adapter type name
        #

        printer_adapter_params = { 'Generic': generic_params,
            'JetDirect': jet_direct_params,
            'Lantronix': lantronix_params,
            'Microplex200': microplex_200_params,
            'Microplex202': microplex_202_params,
            'PrintServer': print_server_params
        }

        #
        # create the specified printer adapter
        #

        try:

            # get the parameters for adding the specified group
            params = printer_adapter_params[adapter_type]

            # add the application group with the specified parameters
            self._ldap_connection.add_ntcss_printer_adapter_type(
                params['type'], params['ports'], params['config_script'])

        except KeyError:
            raise DesktopException("Cannot create the specified printer "
                "adapter '{0}' because it is unknown.".format(adapter_type))


    def create_app_group(self, app_group_name):
        """
        """

        #
        # Set up all of the dictionaries with the values that need to be passed
        # in for the app group creation.
        #

        nalcomis_params = { 'application_name': 'NALCOMIS',
            'app_unix_group': 'nalcomis',
            'app_icon_file': '$NTCSSDIR\\..\\OIMACL\\bin\\nalcomis.exe',
            'kwargs': { 'application_host': ntcss_ldap.SLAVE_AUTH_SERVER,
                'app_client_location': '$NTCSSDIR\\..\\OIMACL\\bin\\nalcomis.exe',
            }
        }

        ntcss_params = { 'application_name': 'NTCSS',
            'app_unix_group': 'ntcss',
            'app_icon_file': '$NTCSSDIR\\resource\\folder.ico',
            'kwargs': { 'app_client_location': '$NTCSSDIR',
                'app_server_location': 'ntcss_server_dir',
            }
        }

        ommsng_params = { 'application_name': 'OMMSNG',
            'app_unix_group': 'ommsng',
            'app_icon_file': '$NTCSSDIR\\..\\OMMSCL\\data\\images\\icons\\ommsng.ico',
            'kwargs': { }
        }

        pomsng_params = { 'application_name': 'POMSNG',
            'app_unix_group': 'pomsng',
            'app_icon_file': '$NTCSSDIR\\..\\POMSCL\\data\\images\\icons\\ommsng.ico',
            'kwargs': { }
        }

        radm_params = { 'application_name': 'RADM',
            'app_unix_group': 'radm',
            'app_icon_file': '$NTCSSDIR\\..\\RADMCL\\bin\\radm.exe',
            'kwargs': { }
        }

        rsupply_params = { 'application_name': 'RSUPPLY',
            'app_unix_group': 'rsupply',
            'app_icon_file': '$NTCSSDIR\\..\\SUP1CL\\data\\images\\navlogo1.ico',
            'kwargs': { }
        }

        #
        # create the dictionary that ties the application group creation
        # parameters to the group name
        #

        app_group_params = { 'NALCOMIS': nalcomis_params,
            'NTCSS': ntcss_params,
            'OMMSNG': ommsng_params,
            'POMSNG': pomsng_params,
            'RADM': radm_params,
            'RSUPPLY': rsupply_params,
        }

        #
        # create the specified group entry
        #

        try:

            # get the parameters for adding the specified group
            params = app_group_params[app_group_name]

            # add the application group with the specified parameters
            self._ldap_connection.add_ntcss_application_group(
                params['application_name'], params['app_unix_group'],
                params['app_icon_file'], **params['kwargs'])

            # create the associated pam account associated with the app group
            self._ldap_connection.add_pam_group(params['app_unix_group'])

        except KeyError:
            raise DesktopException("Cannot create the specified application "
                "group '{0}' because it is unknown.".format(app_group_name))

    #
    # Per the /LIBS/INCLUDE/Ntcss.h file:
    #
    # typedef struct  _HostItem {
    #     int  marker;
    #     char  *hostname;
    #     char  *ip_address;
    #     int   num_processes;
    #     /*98-08-06: GWY Added type to HostItem for ATLAS:
    #       0 - Master, 1 - App Server, 2 - Authentication Server,
    #       5 - Adapter, 6 - Printer
    #     */
    #     int  type;
    #     /*98-09-02: ACA added replication indicator for ATLASS
    #       0 = NO Replication, 1 = Replicatino */
    #     int repl;
    #     char  *fqdn;            /* Fully Qual Domain Name */
    # } HostItem;
    #

    def create_master_host(self, server_fqdn, server_ip):
        """
        """

        # set the replication status to 'NO Replication'
        replication_status = '0'

        # set the server type to 'Master'
        server_type = '0'

        self._ldap_connection.add_ntcss_host(replication_status, server_fqdn,
            server_ip, server_type)

    def create_slave_host(self, server_fqdn, server_ip):
        """
        """

        # set the replication status to 'Replicatino'
        replication_status = '1'

        # set the server type to 'Slave'
        server_type = '2'

        self._ldap_connection.add_ntcss_host(replication_status, server_fqdn,
            server_ip, server_type)

    def create_sysconf_entries(self):
        """
        """

        # get the template variables so that we can get the NT domain
        template_variables =  ntcss_config.get_template_variables()

        # set up the dictionary of entries we need to add
        config_entries = {
            'DBPASSWDAGING': '60',
            'DBPASSWDHISTORY': '10',
            'DBPASSWDSPECIAL': '=[];,./!#$%^*()_|',
            'DBPASSWDUPD': '200704041300',
            'NTCSS_HELP_INI_DIR': '/h/NTCSSS/applications/data/help_ini',
            'NTCSS_HOME_DIR': '/h/USERS',
            'NTCSS_MULTI-USER_ADMIN_MODE': 'Disabled',
            'NTCSS_UNIX_PASSWD_FILE': '/etc/passwd',
            'NTDOMAIN': template_variables['windows_domain_name'],
            'PASSWORD_AGING': '0',
            'PASSWORD_WARNING': '0',
            'SYBASE_SA_USER': 'ssabtusr',
            'SYBASE_USER': 'sybbtusr',
            'APP_TIMEOUT': '900'
        }

        # add every entry to the ldap server
        for entry in config_entries.keys():

            self._ldap_connection.add_ntcss_sysconf_data(entry,
                config_entries[entry])

    def create_ldap_structure(self):
        """
        """

        # create the list of all of the top level directories to create
        directories = ['ADAPTER_TABLE', 'ADAPTER_TYPE_TABLE', 'APPS_TABLE',
            'APPUSER_TABLE', 'AUTH_TABLE', 'Groups', 'HOSTS_TABLE', 'People',
            'PRINTER_TABLE', 'SYSCONF_TABLE']

        # create each directory
        for directory in directories:
            self._ldap_connection.add_ntcss_top_level_ldap_entry(directory)
