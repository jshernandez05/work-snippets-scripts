"""
Commonly used NTCSS functions (used by system-config-baseline and other python
modules on the NTCSS server).
"""
import logging
import logging.handlers
import sys
import syslog


# The admin role is used by NTCSS and APPS
# The batch user role which will be used exclusively by the batch users.
#
# See the notes above the 'ntcss_ldap.add_app_permissions_to_ntcss_user'
# method for # a more detailed explanation as to why these values are set this
# way.

NTCSS_APP_ROLE_INDEX = { 'APP_ADMIN_ROLE': '4',
                         'SEC_ADMIN_ROLE': '8',
                         'ALL_USERS_ROLE': '8',
                         'TEST_USERS_ROLE': '16',
                         'OPERATOR_ROLE': '16',
                         'BATCH_USER_ROLE': '1024' }


# This is a mapping of ntcss user security classifications
#
# index is the classification name
# key is the corresponding number associated for that classification
USER_CLASSIFICATION_INDEX = { 'UNCLASSIFIED': '0',
                              'UNCLASSIFIED_SENSITIVE': '1',
                              'CONFIDENTIAL': '2',
                              'SECRET': '3',
                              'TOP_SECRET': '4' }


# This is a mapping of ntcss applications to their linux pam group
#
# index is the application name from the APPUSER_TABLE in ldap
# key is the corresponding pam group from the Groups
APP_PAM_GROUP_INDEX = { 'NALCOMIS': 'nalcomis',
                        'NTCSS': 'ntcss',
                        'OMMSNG': 'ommsng',
                        'POMSNG': 'pomsng',
                        'RADM': 'radm',
                        'RSUPPLY': 'rsupply' }


# global for setting the stream handler, can be altered by calling app
ntcss_logging_stream_handler = True

def configure_root_logger():

    # get the root logger
    logger = logging.getLogger('ntcss-logger')

    # create the basic log formatter
    log_format = "%(asctime)s:%(filename)s:%(levelname)s:%(message)s"
    date_format = "%Y-%m-%d %H:%M:%S"
    formatter = logging.Formatter(log_format, date_format)

    # create the stdout stream handler
    stream_handler = logging.StreamHandler(sys.stdout)
    stream_handler.setFormatter(formatter)

    # create a file stream handler since rsyslog mangles some of the logging
    # information from the formatter (e.g. module name)
    file_handler = logging.FileHandler('/var/log/system-config-baseline.log')
    file_handler.setFormatter(formatter)

    # add the stream handlers
    if ntcss_logging_stream_handler:
        logger.debug('adding stream handler')
        logger.addHandler(stream_handler)

    logger.addHandler(file_handler)

    # enable the handler
    logger.disabled = False
    logger.setLevel(logging.DEBUG)

    # return  the logger, unnecessary but this is a convenience
    return logger

def get_ntcss_env_template_variables(ntcss_env_file):

    try:

        template_dict = {}
        ntcss_env_dict = {}

        with open(ntcss_env_file) as file:

            for line in file:

                # remove the 'export ' text and split on the first '='
                site_survey_variable = line[7:].split('=', 1)[0].strip()
                site_survey_value = line[7:].split('=', 1)[1].strip()

                ntcss_env_dict[site_survey_variable] = site_survey_value

        # process the unit configuration
        if ntcss_env_dict['CF'] == 'Unit':
            template_dict['ntcss_suite_configuration'] = 'unit'

        # process the force master configurations
        elif (ntcss_env_dict['CF'] == 'Force') and ('SIP' in ntcss_env_dict):

            # determine if this is a NAS configuration
            if ntcss_env_dict['air_load'] == 'y':
                template_dict['ntcss_suite_configuration'] = 'nas-force-master'

            # determine if this is a MALS configuration
            elif ntcss_env_dict['opt_mals'] == 'y':
                template_dict['ntcss_suite_configuration'] = \
                    'mals-force-master'

            # otherwise this must be a clean force configuration
            else:
                template_dict['ntcss_suite_configuration'] = 'force-master'

        # process the force slave configurations
        elif (ntcss_env_dict['CF'] == 'Force') and ('MIP' in ntcss_env_dict):

            # determine if this is a NAS configuration
            if ntcss_env_dict['air_load'] == 'y':
                template_dict['ntcss_suite_configuration'] = 'nas-force-slave'

            # determine if this is a MALS configuration
            elif ntcss_env_dict['opt_mals'] == 'y':
                template_dict['ntcss_suite_configuration'] = 'mals-force-slave'

            # otherwise this must be a clean force configuration
            else:
                template_dict['ntcss_suite_configuration'] = 'force-slave'

        # process the poms configuration
        elif ntcss_env_dict['CF'] == 'POMMSNG':
            template_dict['ntcss_suite_configuration'] = 'poms'

        # process the take configuration
        elif ntcss_env_dict['CF'] == 'T-AKE':
            template_dict['ntcss_suite_configuration'] = 'take'

        else:
            raise NameError("The suite configuration '{0}' specified in thei"
                "site survey is unrecognized.".format(ntcss_env_dict['CF']))


        # Get the windows domain name
        template_dict['windows_domain_name'] = ntcss_env_dict['domname']

        # set the server's host information
        template_dict['server_ip_address'] = ntcss_env_dict['IP']
        template_dict['server_host_name'] = ntcss_env_dict['HN']
        template_dict['server_domain_name'] = ntcss_env_dict['DM']
        template_dict['server_fqdn'] = '.'.join([ntcss_env_dict['HN'],
            ntcss_env_dict['DM']])

        # if we are currently the master server, set the server's info to the
        # corresponding master server entries
        if is_master_ntcss_server(template_dict):

            template_dict['master_server_ip_address'] = template_dict[
                'server_ip_address']
            template_dict['master_server_host_name'] = template_dict[
                'server_host_name']
            template_dict['master_server_fqdn'] = template_dict[
                'server_fqdn']

            # set the slave ip if it exists, the 'SIP' variable will only be
            # set on the master server in the ntcss.env file.
            if 'SIP' in ntcss_env_dict:
                template_dict['slave_server_ip_address'] = ntcss_env_dict[
                    'SIP']
                template_dict['slave_server_host_name'] = 'nalc'
                template_dict['slave_server_fqdn'] = '.'.join(
                    [template_dict['slave_server_host_name'],
                    ntcss_env_dict['DM']])

        else:

            # set the master ip if it exists, the 'MIP' variable will only be
            # set on the slave server in the ntcss.env file. This should always
            # be true since we're on the slave.
            if 'MIP' in ntcss_env_dict:
                template_dict['master_server_ip_address'] = ntcss_env_dict[
                    'MIP']
                template_dict['master_server_host_name'] = 'rsupmast'
                template_dict['master_server_fqdn'] = '.'.join(
                    [template_dict['master_server_host_name'],
                    ntcss_env_dict['DM']])

            # use the current server's info since it's the slave server
            template_dict['slave_server_ip_address'] = template_dict[
                'server_ip_address']
            template_dict['slave_server_host_name'] = template_dict[
                'server_host_name']
            template_dict['slave_server_fqdn'] = template_dict[
                'server_fqdn']

        return template_dict

    except IOError:
        return {}

def get_miscellaneous_template_variables():

    template_dict = {}

    # ldap settings
    template_dict['ldap_plain_text_password'] = 'headsup'
    template_dict['ldap_ssha_password'] = \
        '{SSHA}lzwBvitKAuSuRKc62HHilONwMeWTvj7d'

    return template_dict

def get_template_variables():
    """
    Returns a dictionary of ntcss and system related template variables.
    """

    # the location of the ntcss env file
    ntcss_env_file = '/var/log/archmod/ntcss.env'

    ntcss_variables = get_ntcss_env_template_variables(ntcss_env_file)
    misc_variables = get_miscellaneous_template_variables()

    return dict(ntcss_variables.items() + misc_variables.items())

def get_local_ldap_server_admin_credentials():
    """
    Parses local configuration files on the NTCSS server to obtain the
    administrative credentials for the local ldap server.
    """
    return 'cn=admin,o=optimized', 'headsup'

def is_master_ntcss_server(template_variables_dict=None):
    """
    Determines wether or not the current server is the Master server in the
    current NTCSS suite.
    """

    # if the template variables dictionary was not passed in, retrieve it
    if template_variables_dict is None:
        template_variables_dict = get_template_variables()

    # define the list of slave configurations
    slave_configs = ('force-slave', 'nas-force-slave', 'mals-force-slave')

    # get the current configuration
    current_config = template_variables_dict['ntcss_suite_configuration']

    if current_config in slave_configs:
        return False

    return True
