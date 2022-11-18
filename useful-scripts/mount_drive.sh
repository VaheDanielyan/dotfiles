#!/bin/bash

if [[ $# -ne 4 ]]
then
    echo "Usage: ./mount_drive.sh <uid> <gid> <device> <path>"
    exit 1
fi

user_id=$1
group_id=$2
device=$3
path=$4

sudo mount -o umask=0022,gid=$group_id,uid=$user_id $device $path
exit 0
