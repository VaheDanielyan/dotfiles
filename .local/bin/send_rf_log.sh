#!/bin/bash
# to recv
# picocom -b <baud_rate> /dev/ttyUSB*

OUT=$(ls debug 2>&1 | tail -1)

stty -F /dev/ttyUSB0 57600
echo "#########"
echo $OUT

basename -a $OUT | cat > /dev/ttyUSB0
echo "##################" > /dev/ttyUSB0
tail -f debug/"${OUT}" | cat > /dev/ttyUSB0 
