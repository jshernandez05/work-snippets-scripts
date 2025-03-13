"""
Template Processing Module.
"""
import ConfigParser
import exceptions
import logging
import os
import re
from copy import deepcopy
from grp import getgrnam
from pwd import getpwnam

from mako.template import Template
from mako.exceptions import RichTraceback
from mako.runtime import Context

logger = logging.getLogger('ntcss-logger')


class TemplateError(exceptions.Exception):
    """
    Standardized exception thrown during template processing.
    """
    pass


class TemplateMetadata(object):
    """
    Template metadata configuration object that hold all of the information
    necessary to process a template file.
    """

    DEFAULT_USER = 'default_user'
    DEFAULT_GROUP = 'default_group'
    DEFAULT_PERMISSIONS = 'default_permissions'

    def __init__(self, file='', template_file='', template_file_name='',
        user=DEFAULT_USER, group=DEFAULT_GROUP,
        permissions=DEFAULT_PERMISSIONS):
        """
        Default call to initialize the TemplateMetadata object.
        """

        self.file = file
        self.template_file = template_file
        self.template_file_name = template_file_name
        self.user = user
        self.group = group
        self.permissions = permissions

    @property
    def uid(self):
        """
        This property returns the uid of the user name that was set in the
        'user' data member.
        """
        try:

            if self.user == self.__class__.DEFAULT_USER:
                return None

            return getpwnam(self.user).pw_uid

        except TypeError:
            raise TemplateError("The user {0} is not a valid user "
                "name.".format(self.user))

        except KeyError:
            raise TemplateError("The user '{0}' does not exist on "
                "the system.".format(self.user))

    @property
    def gid(self):
        """
        This property returns the gid of the group name that was set in the
        'group' data member.
        """

        try:

            if self.group == self.__class__.DEFAULT_GROUP:
                return None

            # apparently on the pw.getpwnam call throws a type error. this is
            # different from the grp.getgrnam functionality

            return getgrnam(self.group).gr_gid

        except KeyError:
            raise TemplateError("The group '{0}' does not exist on the "
                "system.".format(self.group))

    @property
    def file_mask(self):
        """
        This property returns the file mask for the permissions set in the
        'permissions' data member.
        """

        if self.permissions == self.__class__.DEFAULT_PERMISSIONS:
            return None

        if re.match('^[0-7]+$', self.permissions) is None:
            raise TemplateError("The specified permissions '{0}' are "
                "invalid.".format(self.permissions))

        # return the base 8 value of the permissions (e.g. turn '777' to 0777)
        return int(self.permissions, 8)

    def log(self, section):
        """
        Logs all of the desired values in the TemplateMetadata object.
        """
        variables = ('file', 'template_file', 'user', 'uid', 'group', 'gid',
            'permissions', 'file_mask')

        for variable in variables:
            logger.debug("{0}.{1} = {2}".format(section, variable,
                getattr(self, variable)))


class TemplateProcessor(object):
    """
    Processor class.
    """

    def __init__(self, template_directory='', template_variables=None,
        template_config_file='template_config'):

        # deep copy the passed in variable dictionary
        self.template_variables = dict(template_variables)

        # import the metadata
        self._import_template_metadata(template_directory,
            template_config_file)

    def _import_template_metadata(self, directory, config_file):

        # initialize the metadata dictionary
        self.template_metadata = {}

        # set the template directory
        self.template_directory = directory

        # determine the full path of the template config file
        self.template_config_file = os.path.join(directory, config_file)

        logger.info("Importing templates and template configuration "
            "from: {0}".format(self.template_directory))

        # validate that the template directory exists
        if not os.path.isdir(self.template_directory):
            raise TemplateError("The specified template directory '{0}' does "
                "not exist.".format(self.template_directory))

        # get the configuration parser
        config = ConfigParser.RawConfigParser()

        # read the config file
        if not config.read(self.template_config_file):
            raise TemplateError("The template_config file cannot be read or it"
                " does not exist.")

        logger.info("Loaded the template_config file located at: "
            "'{0}'".format(self.template_config_file))

        logger.info('There are {0} sections specified in the '
            'template_config'.format(len(config.sections())))

        if len(config.sections()) == 0:
            raise TemplateError("The specified template_config file '{0}' has "
                "no configuration sections defined.".format(
                self.template_config_file))

        for section in config.sections():
            logger.info("Importing metadata from the [{0}] section.".format(
                section))

            section_dict = dict(config.items(section))

            metadata = TemplateMetadata()

            for key in section_dict:

                try:

                    if not hasattr(metadata, key):
                        raise TemplateError("The template_config key '{0}' in "
                            "the section '{1}' is invalid.".format(key,
                            section))

                    setattr(metadata, key, section_dict[key])

                except AttributeError:
                    raise TemplateError("The template configuration key "
                        "'{0}' in the section '{1}' is a property that cannot "
                        "be set.".format(key, section))

            metadata.template_file = os.path.join(self.template_directory,
                metadata.template_file_name)

            self.template_metadata[metadata.file] = metadata

            logger.debug("Imported the metadata from the [{0}] section "
                "successfully.".format(section))

            metadata.log(section)

    def _apply_template(self, metadata=None):

        if metadata is None:
            raise TemplateError('No template metadata was provided')

        logger.info("Applying the '{0}' template to '{1}'".format(
            metadata.template_file, metadata.file))

        try:

            template = Template(filename=metadata.template_file)

            try:

                with open(metadata.file, 'w') as opened_file:

                    context = Context(opened_file, **self.template_variables)

                    template.render_context(context)

                logger.debug("The template was successfully applied to "
                    "'{0}'".format(metadata.file))

                # conditionally set the uid
                if not metadata.uid == None:

                    try:
                        os.chown(metadata.file, metadata.uid, -1)
                    except OSError:
                        raise TemplateError("Failed to set the owner of the "
                            "file '{0}' to '{1}'.".format(metadata.file,
                            metadata.user))

                    logger.info("Set the owner of the file '{0}' to "
                        "'{1}'.".format(metadata.file, metadata.user))

                # conditionally set the gid
                if not metadata.gid == None:

                    try:
                        os.chown(metadata.file, -1, metadata.gid)
                    except OSError:
                        raise TemplateError("Failed to set the group of the "
                            "file '{0}' to '{1}'.".format(metadata.file,
                            metadata.group))

                    logger.info("Set the group of the file '{0}' to "
                        "'{1}'.".format(metadata.file, metadata.group))

                # conditionally set the file mask
                if not metadata.file_mask == None:

                    try:
                        os.chmod(metadata.file, metadata.file_mask)
                    except OSError:
                        raise TemplateError("Failed to set the permissions of "
                            "the file '{0}' to '{1}'.".format(metadata.file,
                            metadata.permissions))

                    logger.info("Set the permission of the file '{0}' to "
                        "'{1}'.".format(metadata.file, metadata.permissions))

            # will occur if the destination file cannot be opened for writing
            except IOError:
                raise TemplateError("The target file '{0}' could not be "
                    "opened for writing.".format(metadata.file))

            # can occur in the Template.render() call
            except NameError:
                traceback = RichTraceback()
                invalid_line = traceback.source.split('\n')[
                    traceback.lineno - 1]
                raise TemplateError("The line '{0}' in the file '{1}' has a "
                    "variable that could not be replaced.".format(
                    invalid_line, metadata.template_file))

        # this exception will occur when then template file cannot be read
        except IOError:
            raise TemplateError("The template file '{0}' does not exist, or "
                "it cannot be read.".format(metadata.template_file))

    def apply_all_templates(self):

        logger.info("Applying all configuration templates.")

        applied_successfully = True

        for metadata in self.template_metadata.values():

            try:

                self._apply_template(metadata)

            except TemplateError as template_error:

                logger.warn("Failed to apply the template file: '{0}'".format(
                    metadata.template_file))
                logger.warn("The following error occured: '{0}'".format(
                    template_error))

                applied_successfully = False

        return applied_successfully

    def apply_template_to_file(self, file_path):

        logger.info("Applying the single template to the location "
            "'{0}'.".format(file_path))

        try:

            if file_path not in self.template_metadata:
                logger.warn("There is no template metadata associated with "
                    "the file path '{0}'.".format(file_path))

                return False

            self._apply_template(self.template_metadata[file_path])

        except TemplateError as template_error:

            logger.warn("Failed to apply the template file: '{0}'".format(
                metadata.template_file))
            logger.warn("The following error occured: '{0}'".format(
                template_error))

            return False

        return True

    def backup_file(self, file=''):
        pass

    def restore_file(self, file=''):
        pass
