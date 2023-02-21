#!/usr/bin/python
"""
This script can be used to cleanup reports and log
directories on both rsupmast and nalc. 
rsupmast directories:
SUP1BT -> reports, tape_in, tape_out, workspace, log
          NTCSS and Sybase errorlogs
nalc directories:
OIMABT -> reports, sup_interface, interface log, 
          external interface
          NTCSS and Sybase errorlogs
"""
from __future__ import print_function
import os
import platform
import sys
import time

# lists used to to catch full file paths for delete and display
remove_list = []
age_list = []

def main():
    """
    Identifies host and establish directory variables for
    find_****_aged() functions.
    """
    os.system('cls||clear')

    rsup_dict = {'SUP1BT': '/h/data/local/SUP1BT/', 
                'NTCSS_ERR_LOG': '/h/NTCSS_RSUP/errors/',
                'SYBASE_ERR_LOG': '/opt/sybase/ASE-15_0/install/'
                }
    rsup_dict.update(REP_DIR = ''.join([rsup_dict['SUP1BT'], 'reports/']),
                    TAPE_IN = ''.join([rsup_dict['SUP1BT'], 'tape_in/']),
                    TAPE_OUT = ''.join([rsup_dict['SUP1BT'], 'tape_out/']),
                    LOG_DIR = ''.join([rsup_dict['SUP1BT'], 'log/']),
                    WORKSPACE = ''.join([rsup_dict['SUP1BT'], 'workspace/'])
                    )      
    nalc_dict = {'OIMABT_DIR':'/h/data/local/OIMABT/',
                'REP_DIR': '/h/OIMABT/data/reports/',
                'NTCSS_ERR_LOG': '/h/NTCSS_NALC/errors/',
                'SYBASE_ERR_LOG': '/opt/sybase/ASE-15_0/install/'
                }
    nalc_dict.update(INTERFACE_DIR = ''.join([nalc_dict['OIMABT_DIR'], 'sup_interface/']),
                    EXTERNAL_INTFC = ''.join([nalc_dict['OIMABT_DIR'], 'ext/'])
                    )
    nalc_dict.update(INTERFACE_LOG = ''.join([nalc_dict['INTERFACE_DIR'], 'log/']))

    SHORT_HOST = platform.node().split('.', 1)[0]

    if SHORT_HOST == 'rsupmast':
        dict = rsup_dict
        for dir in dict.values():
            find_rsup_aged(dir)
    elif SHORT_HOST == 'nalc':
        dict = nalc_dict
        for dir in dict.values():
            find_nalc_aged(dir)
    else:
        sys.exit("Hostname '{0}' is not recognized.....exiting!!!".format(SHORT_HOST))
    display(remove_list, age_list)

def find_rsup_aged(dir):
    """
    Finds aged files on rsupmast server.

    creates list of files to remove from the directory list
    based on criteria for each file type.

    change cutoff value to change age criteria.
    """
    reports_cutoff = {'JSS': 15, 'JSL': 15, 'JSI': 15, 'JSF': 180}
    tape_out_cutoff = {'JSS': 30, 'JSL': 30, 'TMP': 30, 'JSI': 180, 'JSF': 365}
    
    before_count = len([name for name in os.listdir(dir) 
                        if os.path.isfile(os.path.join(dir, name))])
    matching_files = 0
    try:
        for file in os.listdir(dir):
            file_age = get_file_age(''.join([dir, file]))
            cutoff = 0
            
        # Establish criteria for file type and age cutoff from
        # each directory
            if 'reports' in dir and file.startswith(('JSS', 'JSL', 'JSI', 'JSF')):
                cutoff = reports_cutoff[file[:3]]
            elif 'tape_out' in dir and file.startswith(('JSS', 'JSL', 'TMP')):
                cutoff = tape_out_cutoff[file[:3]]
            elif 'tape_in' in dir or 'workspace' in dir or 'log' in dir or  ('NTCSS_RSUP' in dir and 'log.' in file) or ('sybase' in dir and 'erroglog' in file):
                cutoff = 7
            else:
                continue

            if file_age > cutoff != 0:
                matching_files += 1
                remove_list.append(''.join([dir, file]))
                age_list.append('{0}cutoff criteria: {1} days {2}file age: {3} days'.format(str(dir+file).ljust(65), str(cutoff).rjust(3),' '.rjust(15), str(int(file_age)).rjust(3)))

        print('Total files in {0} :  {1}\nTotal files matching age criteria:\
        {2}\n'.format(dir, str(before_count), str(matching_files)))
    
    except:
        print(' '.join(["No files meet criteria in ", dir, sys.exc_info()[0:2]]))

def find_nalc_aged(dir):
    """
    Finds aged files on nalc server.

    creates list of files to remove from the directory list
    based on criteria for each file type.

    change cutoff value to change age criteria.
    """
    before_count = len([name for name in os.listdir(dir) 
                        if os.path.isfile(os.path.join(dir, name))])
    matching_files = 0
    
    try:
        for file in os.listdir(dir):
            file_age = get_file_age(dir + file)
            cutoff = 0
            
            # Establish criteria for file type and age cutoff from
            # each directory
            
            if 'reports' in dir and file.startswith(('E', 'H4', 'M', 'H8', 'J', 'P', 'U', 'R'))\
                or 'ext' in dir:
                cutoff = 14
            elif dir == '/h/data/local/OIMABT/':
                cutoff = 14 if file.startswith(('E6', 'J2', 'J6')) else 30 if file.startswith(('J0', 'JS')) else 999 
            elif 'sup_interface' in dir or ('NTCSS_NALC' in dir and 'log.' in file)\
                or ('sybase' in dir and 'erroglog' in file):
                cutoff = 7
            else:
                continue
            if file_age > cutoff != 0:
                matching_files += 1
                remove_list.append(''.join([dir, file]))
                age_list.append('{0}cutoff criteria:  {1} days {2}file age:  \
                {3} days'.format(str(dir+file).ljust(65), str(cutoff).rjust(3),\
                ' '.rjust(15), str(int(file_age)).rjust(3)))

        print('Total files in {0}: {1}\nTotal files matching age criteria:\
        {2}\n'.format(dir, str(before_count), str(matching_files)))

    except:
        print(''.join(["No files meet criteria in ", dir, sys.exc_info()[0:2]]))
        pass

def get_file_age(path):
    """
    Return file age in days.
    """

    # time will be in seconds
    now = int(time.time())
    mtime = os.stat(path).st_mtime
    difference = (now - mtime)
    
    # return age of file in days
    age = divmod(difference, 86400)[0]

    return age

def display(remove_list, age_list):
    if len(remove_list) != 0:
        response = raw_input('\n' + str(len(remove_list)) + ' will be removed.'\
                            +' \n\nWould you like to view list of files to be'\
                            +' removed? Enter [Y/N] or Enter [Q] to quit: ')
        response = response.upper()
        
        if response == 'N' or response == 'NO' or response == '':
            delete_aged(remove_list)    
        elif response  == 'Y' or response == 'YES':
            os.system('cls||clear')
            time.sleep(.2)
            for i in range(0, len(age_list), 35):
                print(*age_list[i:i+35], sep='\n')
                time.sleep(0.3)
            confirmation = raw_input('\nWould you like to remove the above files?'\
                                     +' Enter [Y/N]:')
            confirmation = confirmation.upper()
            if confirmation == 'Y' or confirmation == 'YES':
                delete_aged(remove_list)
            elif confirmation == 'N' or confirmation == 'NO':
                sys.exit('\nNo files will be deleted!!')
            else:
                sys.exit('\nInvalid response!!! No files have been removed.')
        elif response == 'Q' or response == 'QUIT':
            sys.exit()
        else:
            sys.exit('\nInvalid response!!! No files have been removed.')

        print('\n' + str(len(remove_list)) + ' files have been removed.')
    else:
        sys.exit('\n\nThere are 0 files that meet the aged criteria!!!\n')

def delete_aged(list):
    """
    Deletes files appended to the remove_list.
    """
    for item in list:
        os.remove(item)

if __name__ == "__main__":
    main()    
                
