"""
Commonly used NTCSS functions (used by system-config-baseline and other python
modules on the NTCSS server).
"""
import logging
import os
import re
import subprocess
import StringIO
from grp import getgrnam
from pwd import getpwnam

import pexpect


def execute(description, command, log_output=True):
    """
    Logs and executes the specified command.
    """
    logger.info(description)

    # run the command, and pipe stderr to stdout
    p = subprocess.Popen(command,
                         stdout=subprocess.PIPE,
                         stderr=subprocess.STDOUT)

    # get the output from the command
    output = p.communicate()
    stdout = output[0]

    if p.returncode != 0:

        logger.error("The command '{0}' failed with the error: '{1}'".format(
            command, stdout))

    else:

        # log the command output if specified
        if log_output:
            for line in stdout.splitlines():
                if line != '':
                    logger.info(line)

        logger.debug("The command ran successfully")

    return p.returncode


def chmod_command(path, permissions, recursive=False):
    """
    Change path permissions
    """

    if recursive:
        logger.info("Recursively changing the permissions of the path '{0}'"
                    "to '{1}'".format(path, permissions))
    else:
        logger.info("Changing the permissions of the path '{0}'"
                    "to '{1}'".format(path, permissions))

    if re.match('^[0-7]{3,4}$', permissions) is None:
        logger.error("The specified permissions '{0}' are "
                     "invalid.".format(permissions))

    permissions = int(permissions, 8)

    if recursive:
        for root, dirs, files in os.walk(path):
            os.chmod(root, permissions)
            for file in files:
                os.chmod(os.path.join(root, file), permissions)
    else:
        os.chmod(path, permissions)


def chown_command(path, u_name=-1, u_group=-1, recursive=False):
    """
    Change path ownership, and subdirectories/files if recursive specified
    """
    if recursive:
        logger.info("Recursively changing the ownership of the path '{0}'"
                    "to '{1}:{2}'".format(path, u_name, u_group))
    else:
        logger.info("Changing the ownership of the path '{0}'"
                    "to '{1}:{2}'".format(path, u_name, u_group))

    if u_name is not -1:
        uid = getpwnam(u_name).pw_uid
    if u_group is not -1:
        gid = getgrnam(u_group).gr_gid

    if recursive:
        for root, dirs, files in os.walk(path):
            os.chown(root, uid, gid)
            for file in files:
                os.chown(os.path.join(root, file), uid, gid)
    else:
        os.chown(path, uid, gid)


def touch_command(file):
    """
    Touches the specified file.
    """
    return execute("Touching the '{0}' file.".format(file), ['touch', file])


def mkdir_command(directory, make_parents=False):
    """
    Creates the specified directory.
    """
    if make_parents:
        return execute("Creating '{0}' and it's parent directories.".format(
            file), ['mkdir', '-p', directory])

    return execute("Creating the '{0}' directory.".format(file),
        ['mkdir', directory])


def service_command(service_name, service_command):
    """
    Runs the specified service command.
    """
    actions = {'stop': 'Stopping', 'start': 'Starting', 'restart':
               'Restarting'}

    if service_command not in actions:
        raise NameError("The service command '{0}' is invalid.".format(
            service_command))

    description = "{0} the '{1}' service.".format(actions[service_command],
                  service_name)

    return execute(description, ['/sbin/service', service_name,
                   service_command])


def get_file_from_server(fqdn, user, password, src_file, dest_file):
    """
    This method retrieves a file from a server using the rsync command.
    """

    def display_rsync_output(output_buffer, command_password,
                             log_method=logger.debug):
        """
        This sub method formats and prints the command output to the specified
        logging function.
        """

        # get the individual lines in the command output and ignore empty lines
        lines = [line for line in output_buffer.getvalue().splitlines() if
                 line]

        # the first line of output should be the command
        log_method('rsync command        -->|{0}|<--'.format(lines[0]))

        # log the other lines of output
        for line in lines[1:]:
            log_method('rsync command output -->|{0}|<--'.format(
                       line.replace(command_password, '******')))

    # create the command
    command = "rsync {0}@{1}:{2} {3}".format(user, fqdn, src_file, dest_file)
    logger.info("Running the command '{0}'".format(command))

    # create a string buffer to log the command output to
    output = StringIO.StringIO()
    output.write('~> {0}{1}'.format(command, os.linesep))

    #
    # spawn the command, specify the expect() call timeout, and specify the
    # string buffer to print the command output to.
    #
    # Note:
    #
    # If the timeout value is too short, expect() calls can fail due to rsync
    # not having a timely enough response. Since this is cross server
    # communication, a reasonably large time delay should be anticipated in
    # unknown operating environents.
    #
    # A timeout exception is expected if the rsync command is waiting for user
    # input that is not being specified (e.g. it prompts for a password again
    # after authentication fails the first time).
    #
    # If you aren't careful, you can set the timeout so that the expect.spawn
    # object will stop reading command output and you will mask the original
    # cause of the failure (e.g. You pass in a bad password, the command
    # doesn't finish in time and failed authentication message never gets
    # printed because the expect() call timed out before the failed
    # authentication message was read)
    #
    rsync = pexpect.spawn(command, timeout=30, logfile=output)

    # turn off echoing so that user input doesnt get duped in the logging
    rsync.setecho(False)

    try:

        # prompt variables
        ssh_unknown_host_prompt = 'continue connecting'
        password_prompt = 'password:'

        # determine which prompt we get first
        i = rsync.expect([ssh_unknown_host_prompt, password_prompt])

        # if we get prompted to accept the authenticity of the host...
        if i == 0:

            # accept the host blindly (note the security implications here)
            rsync.sendline('yes')

            # we should now expect a password prompt
            rsync.expect(password_prompt)

        # we should be at a 'password: ' prompt now
        rsync.sendline(password)

        # the file should be transferred successfully
        rv = rsync.expect(pexpect.EOF)

        # close the command
        rsync.close()

        # test the exit staus
        if rsync.exitstatus == 0:
            logger.info("The rsync command succeeded and the file '{0}' was "
                        "retrieved successfully retrieved.".format(src_file))
            display_rsync_output(output, password)
        else:
            logger.error("The rsync command failed with an exit status of: "
                         "{0}".format(rsync.exitstatus))
            display_rsync_output(output, password, log_method=logger.error)

    except pexpect.TIMEOUT as e:
        logger.error("Caught a pexpect.TIMEOUT exception: '{0}'".format(
                     str(e).splitlines()[0]))
        display_rsync_output(output, password, log_method=logger.error)

    except pexpect.EOF as e:
        logger.error("Caught a pexpect.EOF exception: '{0}'".format(
                     str(e).splitlines()[0]))
        display_rsync_output(output, password, log_method=logger.error)

    finally:

        # make sure the expect command / buffers close.
        rsync.close()


# initialize the logger for this instance
logger = logging.getLogger('ntcss-logger')
