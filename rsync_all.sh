#!/bin/bash

# To utilize pass file to be copied to the ./home_sync command
# ex. ./rsync_all_sync .bash_profile
#    ./rsync_all sync file1 file2 file3 file[......]
#    ./rsync_all *
# contents will be copied to users home directory on remote host
# only file with a newer on remote host will be skipped 
# files in destination not matching local will be deleted
# results in an identical directory on remote host
# ensure you are not logged in as root

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

for file in "$@"; do
    FILE_STR+=$(readlink -e)"${file} "
    
done

for HOST in $HOSTS; do
    if [[ $HOST != $HOSTNAME ]]; then
        /usr/bin/rsync -aruv --delete ${FILE_STR}$(who am i | awk '{print$1}')@$HOST:$HOME/
    else
        continue
    fi

done
