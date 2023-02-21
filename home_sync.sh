#!/bin/bash

show_help()
{
    # Display Help
    echo
    echo "Transfer files to all MALS servers."
    echo
    echo "Usage: home_sync [-h](help) <file> [-T dest]{\$HOME}(default is ~/tkit/)"
    echo "  or:  home_sync [-h](help) <-F 'file1 file2' ...> [-T dest]:"
    echo "  NOTE: if sending multiple files, file string must be enclosed in single or double quotations"
    echo "  NOTE: if utilizing -T option -F must be utilized before file name(s)"
    echo 
    echo "Example: home_sync file1" 
    echo "  or:    home_sync -F file1 -T /h/USERS/my_other_than_home_directory/"
    echo "  or:    home_sync -F 'file1 file2 dir1' -T /h/USERS/my_other_than_home_directory/"
    echo 
    echo "flags:"
    echo "-F    Files or directories to be transferred (must be used for multiple files)."
    echo "-T    Path of target destination (default value is users \$HOME/tkit/ directory)"
    echo
    echo "options:"
    echo "-h    Show help."
    echo

}    

    if [ $# -eq 0 ]; then
        echo 'error' >&2 "Usage: $0 -F <'file'> [-T dest] "
        echo 'use -h for more detail'
        exit 1
    else 
        dest=$HOME'/tkit/'
        file=$1 
        while getopts ":hF:T:" opt; do
            case "${opt}" in
                F) file=${OPTARG}    ;;
                T) dest=${OPTARG}    ;;
                h) show_help;   exit 1   ;;
                : | \?)  echo 'error' >&2 "Usage: $0 -F <'file'> [-T dest] "
                    echo 'use -h for more detail'
                    exit 1       
            esac
        #echo $dest
        #echo $file
        done
        shift $((OPTIND -1))
        if [[ $file == "" ]]; then
            echo 'error' >&2 "Usage: $0 -F <'file'> [-T dest] "
            echo 'use -h for more detail'
            exit 1
        else    
            HOSTS="
            rsupmast.mals11 nalc.mals11
            rsupmast.mals12 nalc.mals12
            rsupmast.mals16 nalc.mals16
            rsupmast.mals24 nalc.mals24
            rsupmast.mals36 nalc.mals36
            rsupmast.mals39 nalc.mals39
            rsupmast.mals13 nalc.mals13
            "

            FILE_STR=""

            for files in $file; do
                FILE_STR+="$(readlink -es "$files") "
                done

                #echo $FILE_STR
                echo $dest
                for HOST in $HOSTS; do
                    if [[ $HOST != $HOSTNAME ]]; then
                          /usr/bin/scp -W $HOME/tkit/val -rq ${FILE_STR}$(who am i | awk '{print$1}')@$HOST:$dest
                    else
                        continue
                    fi
                done
       
        fi
    fi
