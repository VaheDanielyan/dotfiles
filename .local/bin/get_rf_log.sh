#!/bin/bash

if [ -z $1 ] || [ -z $2 ];
then
    echo "Usage  ./get_rf_log.sh <usb_port> <output_file>"
    exit
fi
echo "Press C^a then x to quit"
picocom $1 -b 57600 | tee $2
