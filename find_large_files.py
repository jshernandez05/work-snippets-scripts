#!/usr/bin/python
"""
Find files of a given size for given path.

see -h | -help
"""
import argparse
import math as m
import os
import sys

def get_args(argv=None):
    # Create the parser
    my_parser = argparse.ArgumentParser(description='Find file greater than specified size\
                                        \n\nex. /opt 500\n    /opt ', 
                                        formatter_class=argparse.RawDescriptionHelpFormatter
                                       )  #, allow_abbrev=False)

    # Add arguments
    my_parser.add_argument('Path', metavar='path',
                           type=str, help='path to search', 
                          )
    my_parser.add_argument('Size', metavar='size',
                           type=int, help='size of files to look for (in MBs)(default:  100MB)',
                           nargs='?', default=100
                          )
    
    # Parse all args from CLI
    args = my_parser.parse_args()

    return args

# funtion that returns size of a file
def get_file_size(path):

    if os.path.exists(path):
        # getting file size in bytes
        fsize = os.path.getsize(path)

        # returning size of file
        return fsize

    else:
        fsize = 0

# funtion to delete a file
def remove_file(path):

    try:
        os.remove(path)
        print(path + ' successfully deleted')
    except:
        print('unable to delete ' + path)

def human_bytes(B):
    # Return the given bytes as human friendly KiB, MiB, GiB, or TiB string
    B = float(B)
    KB = float(1024)
    MB = float(KB ** 2) # 1,048,576
    GB = float(KB ** 3) # 1,073,741,824
    TB = float(KB ** 4) # 1,099,511,627,776

    if B < KB:
        return '{0} {1}'.format(B, 'Bytes' if 0 == B > 1 else 'Byte')
    elif KB <= B < MB:
        return '{0:.2f} KiB'.format(B/KB)
    elif MB <= B <= GB:
        return '{0:.2f} MiB'.format(B/MB)
    elif GB <= B <= TB:
        return '{0:.2f} GiB'.format(B/GB)
    elif TB <= B:
        return '{0:.2f} TiB'.format(B/TB)

def humanbytes(B):
    # Return the given bytes as human friendly KB, MB, GB, or TB string
    B = float(B)
    KB = float(1000)
    MB = float(KB ** 2) 
    GB = float(KB ** 3) 
    TB = float(KB ** 4) 

    if B < KB:
        return '{0} {1}'.format(B, 'Bytes' if 0 == B > 1 else 'Byte')
    elif KB <= B < MB:
        return '{0:.2f} KB'.format(B/KB)
    elif MB <= B <= GB:
        return '{0:.2f} MB'.format(B/MB)
    elif GB <= B <= TB:
        return '{0:.2f} GB'.format(B/GB)
    elif TB <= B:
        return '{0:.2f} TB'.format(B/TB)

def main(args):
    # specify the path
    path = args.Path  #sys.argv[1]
    
    # file size criteria in MBs
    size = args.Size * 1024 * 1024  #convert bytes to MBs
    dir_size = 0
    
    list1 = []
    # check if path exists
    if not os.path.isdir(path):
        print('The path specified ' + path + ' does not exist.')
        sys.exit()
        
    # traverse through subfolders
    for dir_path, dir_names, files in os.walk(path, topdown=True):
        for file in files:
            # setting exlusion filters based on path
            if path ==  '/':
                exclude = set(['/opt', '/var', '/home', '/dev/shm', '/boot', '/h', '/tmp'])
            elif path == '/var' or path == '/var/':
                exclude = set(['/var/log', '/var/log/audit'])
            elif path == '/var/log' or path == '/var/log/':
                exclude = set(['/var/log/audit'])
            elif path == '/opt' or path == '/opt/':
                exclude = set(['/opt/sybase'])
            else:
                exclude = set([])
            
            
            # getting file path
            file_path = os.path.join(dir_path, file)
            list1.append(file_path)
    
    filtered_list = [i for i in list1 if not any(w in i for w in exclude)]
    
    for f in filtered_list:
        # check file size
	if not os.path.islink(f):
            if os.path.exists(f):
                dir_size += get_file_size(f)
                if get_file_size(f) >= size:
                    #final_list = []
		    col1 = f
                    col2 = (str(human_bytes(os.path.getsize(f)))) 
		    col3 = (str(humanbytes(os.path.getsize(f))))
   		    print('{0}{1}{2}'.format(col1.ljust(70), col2.rjust(20), col3.rjust(22)))	

if __name__ == '__main__':
    argv = None
    args = get_args(argv)
    MULTIPLES = ["B", "k{}B", "M{}B", "G{}B", "T{}B", "P{}B", "E{}B"]
    main(args)
