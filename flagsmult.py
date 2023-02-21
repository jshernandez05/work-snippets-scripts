#!/usr/bin/env python2

# import libraries
from socket import gethostbyaddr as gh
import argparse
import subprocess
import os

# Create cli argument parser


def get_args(hosts, argv=None):
    parser = argparse.ArgumentParser(description='Run SQLs on multiple hosts at once\
                                                 \n\nex. /opt 500\n    /opt ',
                                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    # Add arguments
    server_group = parser.add_mutually_exclusive_group(required=True)
    type_group = parser.add_mutually_exclusive_group(required=True)
    server_group.add_argument('-a', '--all', dest='hosts', action='store_const', const=hosts,
                              help='set hosts list to run command/sql on all hosts')
    parser.add_argument('-l', '--linux', action='store_true',
                        help='specify whether to run system commands or query databases')
    parser.add_argument('-m', '--master', action='store_true',
                        help='Database to run query in')
    server_group.add_argument('-n', '--nalc', dest='hosts', action='store_const',
                              const=[x for x in hosts if 'nalc' in x],
                              help='set hosts list to run command/sql on nalc hosts only')
    server_group.add_argument('-r', '--rsupmast', dest='hosts', action='store_const',
                              const=[x for x in hosts if 'rsupmast' in x],
                              help='set hosts list to run command/sql on nalc hosts only')
    type_group.add_argument('-C', '--commands', nargs=1,
                            help='''Enter you linux command or Sql (commnad must be enclosed in quotes '' or "")''')
    type_group.add_argument('-F', '--file', help='file with sql statement or bash/linux commands',
                            nargs='+')
    server_group.add_argument('-H', '--host', dest='hosts', nargs='+',
                              help='provide of ip(s) or fqdn(s) to run command/sql on')
    type_group.add_argument('-S', '--script', nargs='+',
                            help='full bash/linux/python/sql executable file to be run')

    # Parse all args from CLI
    args = parser.parse_args()
    files = args.file
    master = args.master
    script = args.script
    commands = args.commands
    linux = args.linux
    host = args.hosts

    print(vars(args))
    return args, files, master, script, commands, linux, host

# Get the fully qualified domains for each server


def get_fqdn(host, master, fqdn_list, db_list):
    for fqdn in host:
        if (fqdn.split('.')[0]) in ['nalc', 'rsupmast']:
            fqdn = fqdn
        elif (fqdn.split('.')[0]) not in ['nalc', 'rsupmast']:
            fqdn = gh(fqdn)[0]
        fqdn_list.append(fqdn)
        db = 'master' if master else ('p2db' if fqdn.split('.')[
                                      0] == 'nalc' else 'supply')
        db_list.append(db)
    return fqdn_list, db_list

# send file to be run to the respective server via scp


def push_file(file, fqdn):
    subprocess.call(['scp', '-q', file, fqdn + ':/tmp/'])
    print('push', fqdn, file)

# pull information from each serve utilizing ssh


def pull_file(fqdn, file, outfile):
    subprocess.call(
        ['ssh', '-qt', fqdn, "cat ~/val | sudo -S echo -n "" &> /dev/null; sudo chmod 666 " + outfile])
    os.system(
        'ssh -q {0} cat {1} >> $HOME/{2}.out'.format(fqdn, outfile, file))
    print('pull', fqdn, file, outfile)

# Run SQL file on each server indicated


def run_sql_file(fqdn, db, user, pwd, outfile, t):
    cmd = "cat ~/val | sudo -S echo -n \"\" &> /dev/null; sudo su - sybase -c \'echo \"{0}\" | isql -U{1} -P{2} -D{3} -w500 -s\"|\" -o {4}\'".format(
        t, user, pwd, db, outfile)
    subprocess.call(['ssh', '-qt', fqdn, cmd])
    print('run', fqdn, db, user, pwd, outfile, t)

# Run Bach script on each server indicated


def run_shell_file(fqdn, outfile, t):
    cmd = "cat  ~/val | sudo -S echo -n \"\" &> /dev/null; " + t
    subprocess.call(['ssh', '-qt', fqdn, cmd])
    print('run shell f', fqdn, outfile, t)

# Run cli command on each server indicated


def run_shell_cmd(fqdn, command, outfile, unit):
    subprocess.call(
        ['ssh', '-qt', fqdn, "cat ~/val | sudo -S echo -n "" &> /dev/null; echo {0}: > {1}; {2} >> {1}".format(unit, outfile, command)])
    print('run shell c', command, outfile)

# Run cli sql command on each server indicated


def run_sql_cmd(fqdn, command, user, pwd, db, outfile):
    cmd = "cat ~/val | sudo -S echo -n \"\" &> /dev/null; sudo su - sybase -c \'echo \"{0}\" | isql -U{1} -P{2} -D{3} -w500 -s\"|\" -o {4}\'".format(
        command, user, pwd, db, outfile)
    subprocess.call(['ssh', '-qt', fqdn, cmd])
    print('run_sql c', fqdn, command, user, pwd, db, outfile)


def main():
    # Get cli aruguments and flags
    args, files, master, script, commands, linux, host = get_args(hosts, argv)
    fqdn_list = []
    db_list = []

    get_fqdn(host, master, fqdn_list, db_list)
    fqdn_dict = dict(zip(fqdn_list, db_list))

    for fqdn, db in fqdn_dict.items():
        unit = fqdn.split('.')[1]

        if db == 'master':
            user = 'sybbtusr'
            pwd = "`cat crr`"
        else:
            user = 'ssabtusr'
            pwd = "`cat pd`"

        if files:
            for file in files:
                infile = '/tmp/' + file
                outfile = '/tmp/' + file + '.out'

            if not linux:
                with open(file, 'r') as rf:
                    t = "set nocount on\\ngo\\n" + \
                        (rf.read()).replace('\n', '\\n')

                run_sql_file(fqdn, db, user, pwd, outfile, t)
                pull_file(fqdn, file, outfile)

            elif linux:
                with open(file, 'r') as rf:
                    t = "echo '" + unit + ":' > " + outfile + "; " + \
                        rf.read().replace("\n", " >>  " + outfile + "; ")
                run_shell_file(fqdn, outfile, t)
                pull_file(fqdn, file, outfile)

        elif commands:
            command = commands[0]
            file = 'data1'
            outfile = '/tmp/data1.out'

            if not linux:
                command = 'select nocount on\\ngo\\n' + command + '\\ngo'
                run_sql_cmd(fqdn, command, user, pwd, db, outfile)
                pull_file(fqdn, file, outfile)

            elif linux:
                run_shell_cmd(fqdn, command, outfile, unit)
                pull_file(fqdn, file, outfile)


if __name__ == '__main__':
    argv = None
    hosts = ['nalc.mals11', 'rsupmast.mals11',
             'nalc.mals12', 'rsupmast.mals12',
             'nalc.mals13', 'rsupmast.mals13',
             'nalc.mals16', 'rsupmast.mals16',
             'nalc.mals24', 'rsupmast.mals24',
             'nalc.mals36', 'rsupmast.mals36',
             'nalc.mals39', 'rsupmast.mals39'
             ]
    main()
