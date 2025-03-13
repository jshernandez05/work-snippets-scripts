#!/usr/bin/python

import exceptions
import logging
import os
import shutil
import sys
from itertools import chain

import ldap

import ntcss_config
import ntcss_shell

# declare and initialize the logger instance for the module
logger = logging.getLogger('ntcss-logger')


#
# set the module wide variables for easy access (and definition of) to the
# master and slave server fqdn's
#
__variables = ntcss_config.get_template_variables()

if 'master_server_fqdn' in __variables:
    MASTER_AUTH_SERVER = __variables['master_server_fqdn']
else:
    MASTER_AUTH_SERVER = None

if 'slave_server_fqdn' in __variables:
    SLAVE_AUTH_SERVER = __variables['slave_server_fqdn']
else:
    SLAVE_AUTH_SERVER = None



def connect_to_ldap_server(url, bind_user=None, bind_password=None,
        prefer_anonymous_bind=True, debug_connection=False):
    """
    Returns a LdapUtility instance.
    """

    return LdapUtility(url, bind_user, bind_password, prefer_anonymous_bind,
        debug_connection)

class LdapException(exceptions.Exception):
    """
    Standardized exception thrown to capture LDAP errors.
    """
    pass

class EntryAlreadyExists(LdapException):
    """
    Standardized exception thrown when LDAP entry already exists during an add.
    """
    pass

class NoSuchObject(LdapException):
    """
    Standardized exception thrown when LDAP entry does not exist when doing a
    search.
    """
    pass









class LdapUtility():

    # private members containing the state of the connection
    _connection = None
    _bind_credentials = None
    _bind_state = None
    _prefer_anonymous_bind = None

    def __init__(self, url, bind_user=None, bind_password=None,
            prefer_anonymous_bind=True, debug_connection=False):
        """
        Connects to the specified ldap server with the specified credentials.
        The user name and password will be used to escalate priveledges for
        ldap operations. The 'prefer_anonymous_bind' flag is set to True by
        default so that anonymous bind's may be used to reduce the level of
        access required by most operations. If the 'prefer_anonymous_bind' flag
        is set to False, the bind operation will only occur once as the
        specified user.
        """

        # if the bind user is specified, store the credentials
        if bind_user is not None:
            self._bind_credentials = [bind_user, bind_password]

        # set the anonymous bind setting
        self._prefer_anonymous_bind = prefer_anonymous_bind

        # set debug options
        if debug_connection:
            ldap.set_option(ldap.OPT_DEBUG_LEVEL,255)

        # initialize the ldap connection
        if not debug_connection:
            self._connection = ldap.initialize(url)
        else:
            self._connection = ldap.initialize(url, trace_level=2,
                trace_file=sys.stderr)

        # set the ldap protocol
        self._connection.protocol_version = ldap.VERSION3

        # debug the connection settings
        logger.debug('LDAPObject.deref: {0}'.format(self._connection.deref))
        logger.debug('LDAPObject.network_timeout: {0}'.format(
            self._connection.network_timeout))
        logger.debug('LDAPObject.protocol_version: {0}'.format(
                self._connection.protocol_version))
        logger.debug('LDAPObject.sizelimit: {0}'.format(self._connection.sizelimit))
        logger.debug('LDAPObject.timelimit: {0}'.format(self._connection.timelimit))
        logger.debug('LDAPObject.timeout: {0}'.format(self._connection.timeout))

        # bind anonymously
        self._downgrade_to_anonymous_bind()

    #
    #
    # ldap conection related methods
    #
    #

    def _downgrade_to_anonymous_bind(self):
        """
        This will downgrade the ldap bind to use anonymous authentication if it
        is not already bound anonymously.
        """
        # throw an exception if the connection has not been intialized
        if self._connection is None:
            raise LdapException("The connection to the LDAP server has not "
                "been initialized.")

        # exit early if we are already bound anonymously
        if self._bind_state == 'anonymous_bind':
            return

        # if we don't want to bind anonymously, exit early
        if self._prefer_anonymous_bind == False:
            return

        logger.info("Downgrading to anonymous bind with the ldap server.")

        # bind anonymously and set the bind state
        self._connection.simple_bind_s()
        self._bind_state = 'anonymous_bind'

    def _upgrade_to_user_bind(self):
        """
        This will upgrade the ldap bind to use user authentication if it is not
        with the user's credentials.
        """
        # throw an exception if the connection has not been intialized
        if self._connection is None:
            raise LdapException("The connection to the LDAP server has not "
                "been initialized.")

        # throw an exception if the connection has not been intialized
        if self._bind_credentials is None:
            raise LdapException("No user credentials have been specified to "
                "bind with.")

        # exit early if we are already bound anonymously
        if self._bind_state == 'user_bind':
            return

        logger.info("Upgrading to user bind with the ldap server.")

        # bind with the provided user credentials the bind state
        self._connection.simple_bind_s(*self._bind_credentials)
        self._bind_state = 'user_bind'

    #
    #
    # pam user related methods
    #
    #

    def add_pam_user(self, user_name, uid_number='default',
            gid_number='default', shell='/bin/csh',
            description='NTCSS User Account', root_home_dir='/h/USERS'):
        """
        Adds a pam user with the specified information to LDAP.
        """
        # query ldap to see if the user exists
        user_info = self.get_pam_user_info(user_name)

        # if the user already exists, return the current entry info
        if user_info is not None:
            logger.info("The user '{0}' already exists in "
                "LDAP".format(user_name))
            return user_info

        # add the user to the master if it does not exist
        if ntcss_config.is_master_ntcss_server():

            logger.info("Adding the '{0}' pam user.".format(user_name))

            # set the uid if one wasn't specified
            if uid_number == 'default':
                uid_number = self._get_next_available_pam_uid()
                logger.debug('The user will be created with the uid: '
                    '{0}'.format(uid_number))

            # set the gid if one wasn't specified
            if gid_number == 'default':
                gid_number = '1001'

            # calculate the user home directory
            home_dir = os.path.join(root_home_dir, user_name)

            # specify the dn for the added user account
            add_dn = 'uid={0},ou=People,o=optimized'.format(user_name)

            # create the record that needs to be added to ldap
            add_record = [ ('uid', [user_name]),
                ('cn', [user_name]),
                ('uidNumber', [uid_number]),
                ('gidNumber', [gid_number]),
                ('loginShell', [shell]),
                ('description', [description]),
                ('homeDirectory', [home_dir]),
                ('objectClass', ['top', 'account', 'posixAccount',
                                 'shadowAccount']) ]

            # upgrade to the user bind
            self._upgrade_to_user_bind()

            # add the user
            self._connection.add_s(add_dn, add_record)

            # query ldap and get the data that was added in. This is less
            # efficient, but it prevents us from having to dulicate making
            # similar return value data structures. We may want to change this
            # later, but for now this seems like the simplest and most
            # consistent solution, instead of having to have code in multiple
            # places.
            return self.get_pam_user_info(user_name)

        # otherwise, if we are not on the master server...
        else:

            # warn that the user does not exist in ldap
            logger.warn("The entry for the pam user '{0}' does not "
                "exist in the slave ldap instance.".format(user_name))

            # Probably do not want to proceed with whatever you are doing
            # if this does not exist on the slave
            raise LdapException("The entry for the pam user '{0}' does "
                "not exist in the slave ldap instance.".format(user_name))

    def delete_pam_user(self, user_name):
        """
        Deletes a user with the specified username out of LDAP.
        """
        logger.info("Deleting the '{0}' user.".format(user_name))

        delete_dn = "uid={0},ou=People,o=optimized".format(user_name)

        try:
            # upgrade to the user bind
            self._upgrade_to_user_bind()

            # delete the user
            self._connection.delete_s(delete_dn)

        except ldap.NO_SUCH_OBJECT:
            return
        except ldap.LDAPError:
            raise LdapException("Failed to delete the '{0}' user.".format(
                user_name))

    def get_pam_user_info(self, user_name):
        """
        Gets the passed in user's information stored in LDAP. Returns None
        if there is no pam user in LDAP.
        """
        logger.debug("Getting the '{0}' user's information.".format(user_name))

        get_dn = 'uid={0},ou=People,o=optimized'.format(user_name)

        try:

            # bind anonymously
            self._downgrade_to_anonymous_bind()

            # get the user's info
            results = self._connection.search_s(get_dn, ldap.SCOPE_SUBTREE)

            return self._flatten_pam_objects(results)

        except ldap.NO_SUCH_OBJECT as e:
            return None

    #
    #
    # pam group related methods
    #
    #

    def add_pam_group(self, group_name, gid_number='default'):
        """
        Adds a group with the specified information to LDAP.
        """
        if self.pam_group_exists(group_name):
            logger.info("The group '{0}' already exists in LDAP".format(
            group_name))
            return self.get_pam_group_info(group_name)

        if ntcss_config.is_master_ntcss_server():
            logger.info("Adding the '{0}' pam group.".format(group_name))

            # set the gid if one wasn't specified
            if gid_number == 'default':
                gid_number = self._get_next_available_pam_gid()

            # specify the creation dn string
            add_dn = 'cn={0},ou=Groups,o=optimized'.format(group_name)

            # create the group record
            add_record = [ ('cn', [group_name]),
                ('gidNumber', [gid_number]),
                ('objectClass', ['top', 'posixGroup']) ]

            try:

                self._upgrade_to_user_bind()

                self._connection.add_s(add_dn, add_record)

                # query ldap and get the data that was added in. This is less
                # efficient, but it prevents us from having to dulicate making
                # similar return value data structures. We may want to change this
                # later, but for now this seems like the simplest and most
                # consistent solution, instead of having to have code in multiple
                # places.
                return self.get_pam_group_info(group_name)

            except ldap.ALREADY_EXISTS:
                logger.info("The group '{0}' already exists in LDAP".format(
                group_name))
        else:
            # this seems duplicative, but we want the failure of the
            # user query to be logged in rsyslog and not jsut on the
            # user console
            logger.warn("The entry for the pam group '{0}' does not "
                "exist in the slave ldap instance.".format(group_name))

            raise LdapException("The entry for the pam group '{0}' "
                "does not exist in the slave ldap instance.".format(
                group_name))

    def delete_pam_group(self, group_name):
        """
        Deletes a group with the specified group name out of LDAP.
        """
        logger.info("Deleting the '{0}' group.".format(group_name))

        delete_dn = "cn={0},ou=Groups,o=optimized".format(group_name)

        try:

            # bind as the user
            self._upgrade_to_user_bind()

            # delete the group
            self._connection.delete_s(delete_dn)

        except ldap.LDAPError as e:
            raise LdapException("Failed to delete the '{0}' group.".format(
                group_name))

    def get_pam_group_info(self, group_name=None):
        """
        Gets the passed in group's information stored in LDAP.
        """
        get_dn = 'cn={0},ou=Groups,o=optimized'.format(group_name)

        try:

            # bind anonymously
            self._downgrade_to_anonymous_bind()

            # query ldap for the group
            results = self._connection.search_s(get_dn, ldap.SCOPE_SUBTREE)

            # return the flattened group information
            return self._flatten_pam_objects(results)

        except ldap.NO_SUCH_OBJECT as e:
            raise LdapException("The '{0}' group does not exist in LDAP.".format(
                group_name))

    def pam_group_exists(self, pam_group):
        """
        This method checks to see if the passed in group exists.
        """

        try:
            self.get_pam_group_info(pam_group)

        except LdapException:
            return False

        return True

    def modify_pam_group_info(self, group_name, attribute, values,
            mod_action=ldap.MOD_REPLACE):
        """
        Allows single attribute modifications of group info.
        """
        modify_dn = "cn={0},ou=Groups,o=optimized".format(group_name)

        # create the list of attributes to modify
        attrs = [(mod_action, attribute, values)]

        # bind as the user
        self._upgrade_to_user_bind()

        self._connection.modify_s(modify_dn, attrs)

    def delete_pam_user_from_pam_group(self, pam_user, pam_group):
        """
        This method removes a pam user from the specified pam group.
        """
        logger.info("Deleting the '{0}' user from the '{1}' group.".format(
            pam_user, pam_group))

        try:
            self.modify_pam_group_info(pam_group, 'memberUid', pam_user,
                mod_action=ldap.MOD_DELETE)

        except ldap.NO_SUCH_ATTRIBUTE:
            print "The '{0}' user was not a part of the '{1}' group".format(
                pam_user, pam_group)

    def add_pam_user_to_pam_group(self, pam_user, pam_group):
        """
        This method adds a pam user to the specified pam group.
        """
        logger.info("Adding the '{0}' user to the '{1}' group.".format(
            pam_user, pam_group))

        try:
            self.modify_pam_group_info(pam_group, 'memberUid', pam_user,
                mod_action=ldap.MOD_ADD)

        except ldap.TYPE_OR_VALUE_EXISTS as e:
            print "The '{0}' user is already a part of the '{1}' group".format(
                pam_user, pam_group)

    #
    #
    # pam related "private" utility methods
    #
    #

    def _flatten_pam_objects(self, user_list):
        """
        This internal method flattens out the returned user object structure
        from the python-ldap calls. The expected data format is as follow:

        [(user_dn1, user_dict1), (user_dn2, user_dict2), .... ]

        There may be no items in the result list, or there may be multiple.
        This function returns None if there are no items in the user list. This
        function will return a dict if there is one item in the list. And this
        function will return a list of dicts if there are multiple items in the
        user list.
        """
        # if the list is empty return None
        if not user_list:
            logger.debug('No user information was passed in.')
            return None

        # get all of the user dictionaries in the list of (dn,dict) tuples
        user_dict_list = [user_dict for user_dn, user_dict in user_list]

        # for every user dictionary in the list...
        for user_dict in user_dict_list:

            # for every key in the user dictionary
            for key in user_dict.keys():

                # flatten down all of the value lists if possible
                if len(user_dict[key]) == 1:
                    user_dict[key] = user_dict[key][0]

        # return a dict if there is only one in the list
        if len(user_dict_list) == 1:
            # logger.debug('There was only information for one user, '
            #     'flattening the user information to a dictionary')
            return user_dict_list[0]

        # otherwise return the list of dicts.
        logger.debug('Returning a list of {0} user info dictionaries.'.format(
            len(user_dict_list)))
        return user_dict_list

    def _get_next_available_pam_uid(self):
        """
        Searches LDAP for the next available unused uid.
        """
        logger.info("Obtaining the next available uid in " \
            "_get_next_available_pam_uid")

        default_uid = '1002'

        # bind anonymously
        self._downgrade_to_anonymous_bind()

        # TODO: does this throw a ldap.NO_SUCH_OBJECT exception if it doesn't
        # find anything???

        # returns a list of tuples of dn's and the uid
        results = self._connection.search_s('ou=People,o=optimized',
            ldap.SCOPE_SUBTREE, attrlist=['uidNumber'])

        # use a list comprehension to get the list of uid lists
        uid_lists = [uid_dict['uidNumber'] for dn, uid_dict in results \
            if 'uidNumber' in uid_dict]

        # if the list of uid lists is empty return the default uid
        if not uid_lists:
            return default_uid

        # flatten the list of uids
        uids = chain.from_iterable(uid_lists)

        # return the incremented max uid in string format
        return str(int(max(uids)) + 1)

    def _get_next_available_pam_gid(self):
        """
        Searches LDAP for the next available unused gid.
        """

        # 1000 is sybase, start with 1001 which should be ntcss
        default_gid = '1002'

        # bind anonymously
        self._downgrade_to_anonymous_bind()

        # returns a list of tuples of dn's and the gid
        results = self._connection.search_s('ou=Groups,o=optimized',
            ldap.SCOPE_SUBTREE, attrlist=['gidNumber'])

        # use a list comprehension to get the list of gid lists
        gid_lists = [gid_dict['gidNumber'] for dn, gid_dict in results if \
            'gidNumber' in gid_dict]

        # if the list of gid lists is empty return the default gid
        if not gid_lists:
            return default_gid

        # flatten the list of gids
        gids = chain.from_iterable(gid_lists)

        # return the incremented max gid in string format
        return str(int(max(gids)) + 1)

    #
    #
    # ntcss configuration related methods
    #
    #

    def add_ntcss_top_level_ldap_entry(self, entry):
        """
        Adds NTCSS top level entry to LDAP
        """
        logger.info("Adding the NTCSS top level entry '{0}'.".format(entry))

        # create the top level optimized directory
        try:

            # bind as the user
            self._upgrade_to_user_bind()

            # create the record for the directory
            add_dn = 'o=optimized'
            add_record = [ ('o', ['optimized']),
                ('description', ['Optimized NTCSS']),
                ('objectClass', ['top', 'organization']) ]

            # create the top level entry
            self._connection.add_s(add_dn, add_record)

        except ldap.ALREADY_EXISTS:
            pass

        # now create the top level application directory
        try:

            # bind as the user
            self._upgrade_to_user_bind()

            # create the record for the directory
            add_dn = 'ou={0},o=optimized'.format(entry)

            # the default add record
            add_record = [ ('ou', [entry]),
                ('objectClass', ['organizationalUnit']) ]

            # TODO: The People and Groups entries are a bit different (and
            # probably more correct). Sync up the ou generation for the NTCSS
            # directories with the PAM ou's
            if entry == 'People' or entry == 'Groups':
                add_record = [ ('ou', [entry]),
                    ('objectClass', ['top', 'organizationalUnit']) ]

            # create the top level entry
            self._connection.add_s(add_dn, add_record)

        except ldap.ALREADY_EXISTS:
            pass

    def add_ntcss_printer_adapter_type(self, type, ports, config_script):
        """
        Adds an ntcss printer adapterType entry into the ADAPTER_TYPE_TABLE
        in LDAP.
        """
        logger.info("Adding the NTCSS adapterType entry '{0}'.".format(type))

        add_dn = 'adapterType={0},ou=ADAPTER_TYPE_TABLE,o=optimized'.format(
            type)

        add_record = [ ('adapterType', [type]),
                       ('adapterPort', [ports]),
                       ('adapterConfigScript', [config_script]),
                       ('objectClass', ['top', 'adapterTypes']) ]
        try:

            # bind as the user
            self._upgrade_to_user_bind()

            # add the adapter type
            self._connection.add_s(add_dn, add_record)

        except ldap.ALREADY_EXISTS:
            logger.info("The adapterType entry '{0}' already "
                "exists".format(type))

    def add_ntcss_application_group(self, application_name, app_unix_group,
            app_icon_file, application_host='default_to_master_server',
            app_client_location='***', app_server_location='***',
            application_type='0', application_icon_index='0', app_lock='0',
            app_release_date='100916.0000', app_version_number='Patriot 3.40',
            max_running_app_jobs='10', app_title=None):
        """
        Adds an ntcss application group under APPS_TABLE in LDAP.
        """
        logger.info("Adding the NTCSS application group entry '{0}'".format(
            application_name))

        # set the default application title
        if app_title is None:
            app_title = application_name

        # set the default application host
        if application_host == 'default_to_master_server':
            application_host = MASTER_AUTH_SERVER

        # specify the dn of the new group
        add_dn = "cssApplicationName={0},ou=APPS_TABLE"\
                 ",o=optimized".format(application_name)

        # create the record to add
        add_record = [ ('cssAppClientLocation', [app_client_location]),
                       ('cssAppIconFile', [app_icon_file]),
                       ('cssAppIconIndex', [application_icon_index]),
                       ('cssApplicationHost', [application_host]),
                       ('cssApplicationName', [application_name]),
                       ('cssApplicationType', [application_type]),
                       ('cssAppLock', [app_lock]),
                       ('cssAppLinkData', ['REMOVEME']),
                       ('cssAppReleaseDate', [app_release_date]),
                       ('cssAppServerLocation', [app_server_location]),
                       ('cssAppTitle', [app_title]),
                       ('cssAppUnixGroup', [app_unix_group]),
                       ('cssAppVersionNumber', [app_version_number]),
                       ('cssMaxRunningAppJobs', [max_running_app_jobs]),
                       ('objectClass', ['top', 'cssApplication']) ]

        try:

            # bind as the user
            self._upgrade_to_user_bind()

            # add the adapter type
            self._connection.add_s(add_dn, add_record)

        except ldap.ALREADY_EXISTS:
            logger.info("The application entry '{0}' already exists in "
                        "LDAP".format(application_name))

    def add_ntcss_host(self, replication_status, server_fqdn, server_ip,
                       server_type, server_max_batch='30'):
        """
        Adds a host to the HOSTS_TABLE in LDAP.
        """
        logger.info("Adding  host '{0}' under the HOSTS_TABLE in "
            "LDAP".format(server_fqdn))

        # specify the dn for the added host
        add_dn = "cssServerName={0},ou=HOSTS_TABLE,o=optimized".format(
            server_fqdn)

        # create the host record
        add_record = [ ('cssReplicationStatus', [replication_status]),
                       ('cssServerFQDN', [server_fqdn]),
                       ('cssServerIP', [server_ip]),
                       ('cssServerMaxBatch', [server_max_batch]),
                       ('cssServerName', [server_fqdn]),
                       ('cssServerType', [server_type]),
                       ('objectClass', ['top', 'cssHosts']) ]
        try:

            # bind as the user
            self._upgrade_to_user_bind()

            # add the host
            self._connection.add_s(add_dn, add_record)

        except ldap.ALREADY_EXISTS:
             logger.info("The host '{0} already exists under the"
               "HOSTS_TABLE in LDAP".format(server_fqdn))

    def add_ntcss_sysconf_data(self, entry, attribute):
        """
        Adds ntcss config to the SYSCONF_TABLE in LDAP.
        """
        logger.info("Adding the configuration '{0}' item under the "
            "SYSCONF_TABLE in LDAP".format(entry))

        # specify the dn for the configuration setting
        add_dn = "sysconfData={0},ou=SYSCONF_TABLE,o=optimized".format(entry)

        # create the config record to add
        add_record = [ ('sysconfData', [entry]),
                       ('sysconfAttribute', [attribute]),
                       ('objectClass', ['top', 'sysConf']) ]
        try:

            # bind as the user
            self._upgrade_to_user_bind()

            # add the config entry
            self._connection.add_s(add_dn, add_record)

        except ldap.ALREADY_EXISTS:
            logger.info("The configuration '{0} already exists "
                "under SYSCONF_TABLE in LDAP".format(entry))


    #
    #
    # ntcss user related methods
    #
    #

    def add_ntcss_user(self, pam_user_name, database_password,
            windows_user_name=None,
            users_full_name=None, auth_server_name='default_to_master_server',
            auth_lock='0', auth_pw_time='131029.1707', auth_role='0',
            auth_security='0', email_address="N/A", phone="N/A"):
        """
        Adds a ntcss user to the AUTH_TABLE in LDAP.
        """
        logger.info("Adding NTCSS user '{0}' into the AUTH_TABLE in "
                    "LDAP".format(pam_user_name))

        try:

            # set the user's full name to a valid default
            if users_full_name is None:
                users_full_name = pam_user_name

            # set the principal name, default to use the linux account name if
            # the windows username was not specified
            if windows_user_name is not None:
                principal_name = windows_user_name
            else:
                principal_name = pam_user_name

            # set the default auth server name
            if auth_server_name == 'default_to_master_server':
                auth_server_name = MASTER_AUTH_SERVER

            # ntcssii user needs to line up with /etc/passwd
            if pam_user_name == 'ntcssii':
                auth_uid = '1001'
            else:
                # get the pam user's info
                user_info = self.get_pam_user_info(pam_user_name)

                # get the uid of the pam user
                auth_uid = user_info['uidNumber']

            # arbitrarily set a SSN, not that this does not match the format of
            # a 9 digit SSN. But this is the way it is done by default...
            auth_ssn = "0000000{0}".format(auth_uid)

            # determin the dn for adding the AUTH_TABLE entry
            add_dn = "userLogin={0},ou=AUTH_TABLE,o=optimized".format(
                pam_user_name)

            add_record = [ ('authLock', [auth_lock]),
                           ('authPWTime',[auth_pw_time]),
                           ('authRole', [auth_role]),
                           ('authSecurity', [auth_security]),
                           ('authServerName', [auth_server_name]),
                           ('authSSN', [auth_ssn]),
                           ('authUid', [auth_uid]),
                           ('dbLogin', [database_password]),
                           ('emailAddr',[email_address]),
                           ('ntcssUserName', [users_full_name]),
                           ('ntcssUserPassword', ['REMOVEME']),
                           ('ntcssUserPhone', [phone]),
                           ('objectClass', ['top', 'userAuthServer']),
                           ('principalName', [principal_name]),
                           ('userLogin', [pam_user_name]) ]

            # bind as the user
            self._upgrade_to_user_bind()

            # add the ntcss user record
            self._connection.add_s(add_dn, add_record)

        except NoSuchObject:
            raise NoSuchObject("The user '{0}' does not exist, cannot add "
                "user under the AUTH_TABLE entry in LDAP.".format(
                pam_user_name))

        except ldap.ALREADY_EXISTS:
             logger.info("The user '{0} already exists in "
                "AUTH_TABLE in LDAP".format(pam_user_name))

    def delete_ntcss_user(self, pam_user_name):
        """
        Deletes a ntcss user to the AUTH_TABLE in LDAP.
        """
        logger.info("Deleting NTCSS user '{0}' from the AUTH_TABLE in "
                    "LDAP".format(pam_user_name))
        try:
            if pam_user_name == 'ntcssii':
                return

            # determin the dn for adding the AUTH_TABLE entry
            del_dn = "userLogin={0},ou=AUTH_TABLE,o=optimized".format(
                pam_user_name)

            # bind as the user
            self._upgrade_to_user_bind()

            # add the ntcss user record
            self._connection.delete_s(del_dn)

        except ldap.NO_SUCH_OBJECT:
            return
        except ldap.LDAPError:
            raise LdapException("Failed to delete the '{0}' DN.".format(
                del_dn))



    #
    # In the progroups.ini file application user roles are defined per group.
    # For example the NTCSS group roles look like this:
    #
    # [NTCSS_ROLES]
    # NTCSS_ROLE_1=App Administrator
    # NTCSS_ROLE_2=Security Admin
    # NTCSS_ROLE_3=Operator
    #
    # The 'cssAppRole' value in each entry in the APPUSR_TABLE appears to be
    # mapped to the user roles assigned to the user. The math used to convert
    # between role masks and role names is below:
    #
    #   mask = (1 << (role_number + ROLE_BIT_BASE_OFFSET));
    #
    # The mask computations are done in the MakeUserAccessRoleString function
    # in the ${ntcssdir}/LIBS/SRC/ntcsslib/UserFcts.c function.
    #
    # Note: The role number appears to start at 1. It's not a 0 based index.
    #
    # For example: If I assigned myself Administrator and Operator NTCSS
    #   permissions my permissions would be calculated this way:
    #
    #   admin_mask = (1 << (1 + 1)) = 1 << 2 = 4
    #   operator_mask = (1 << (3 + 1)) = 1 << 4 = 16
    #
    #   'cssAppRole' value = admin_mask + operator_mask = 20
    #
    # In Practice: This means that the mask values per role are:
    #
    #   Role 1: 4
    #   Role 2: 8
    #   Role 3: 16
    #   Role 4: 32
    #    ...
    #
    # And there is also a specially defined Batch user role:
    #
    #   Batch User Role: 1024
    #
    # The batch user role value is specified in the
    # ${ntcss_dir}/LIBS/INCLUDE/Ntcss.h file with the statement
    #
    #   #define NTCSS_BATCH_USER_BIT   1024
    #

    def add_app_permissions_to_ntcss_user(self, application_name, user_login,
            app_registered='0', app_role=ntcss_config.NTCSS_APP_ROLE_INDEX['BATCH_USER_ROLE'],
            ntcss_username='REMOVEME', app_data='REMOVEME',
            app_db='REMOVEME'):
        """
        Adds app group permissions for ntcss_user under APPUSER_TABLE in LDAP.
        """
        logger.info("Adding '{0}' app permissions to the '{1}' user.".format(
            application_name, user_login))

        # specify the dn for the entry we will create
        add_dn="cssApplicationName={0}+userLogin={1},"\
            "ou=APPUSER_TABLE,o=optimized".format(application_name, user_login)

        # create the app user permissions record
        add_record = [ ('cssAppData', [app_data]),
                       ('cssApplicationName', [application_name]),
                       ('cssAppRegistered', [app_registered]),
                       ('cssAppRole', [app_role]),
                       ('ntcssUserName', [ntcss_username]),
                       ('userLogin', [user_login]),
                       ('cssAppDB', [app_db]),
                       ('objectClass', ['top', 'cssAppUsers']) ]
        try:

            # bind as the user
            self._upgrade_to_user_bind()

            # add the permissions record
            self._connection.add_s(add_dn, add_record)

        except ldap.ALREADY_EXISTS:
            logger.info("The application entry "
                "'cssApplicationName={0}+userLogin={1}' already exists in "
                "LDAP".format(application_name, user_login))

    def delete_app_permissions_of_ntcss_user(self, application_name, user_login):
        """
        Deletes app group permissions for ntcss_user under APPUSER_TABLE in LDAP.
        """
        logger.info("Deleting '{0}' app permissions of the '{1}' user.".format(
            application_name, user_login))

        # specify the dn for the entry we will create
        del_dn="cssApplicationName={0}+userLogin={1},"\
            "ou=APPUSER_TABLE,o=optimized".format(application_name, user_login)

        try:
            # bind as the user
            self._upgrade_to_user_bind()

            # add the permissions record
            self._connection.delete_s(del_dn)

        except ldap.NO_SUCH_OBJECT:
            return
        except ldap.LDAPError:
            raise LdapException("Failed to delete the '{0}' DN.".format(
                del_dn))
