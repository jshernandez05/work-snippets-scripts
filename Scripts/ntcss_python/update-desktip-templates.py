#!/usr/bin/python
"""
ntcss-desktop-server update configuration templates script
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

if __name__ == "__main__":

    # configure the root logger
    logger = ntcss_config.configure_root_logger()

    # get the template variables
    template_variables = ntcss_config.get_template_variables()

    # debug output to print the keys
    #for key in sorted(template_variables.keys()):
    #    logger.debug("Loaded templated variable '{0}' = '{1}'".format(key,
    #        template_variables[key]))

    #
    # Determine what type of suite we are configuring
    #
    suite_config = template_variables['ntcss_suite_configuration']
    template_processor = ntcss_template.TemplateProcessor(
        os.path.join('/usr/share/ntcss-desktop-server/templates/',
        suite_config), template_variables)

    #
    # Process needed templates
    # Some template files are modified by the user at the site after installation, such as output_prt,output_type,predefined_jobs
    # User modified files should be handled by the installation script if they need to be modified
    #
    for f in ['/h/NTCSSS/database/access_roles','/h/NTCSSS/database/progrps.ini', '/h/NTCSSS/database/current_apps']:
        template_processor.apply_template_to_file(f)
