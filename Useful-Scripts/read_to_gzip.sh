#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_drive> <dest_gz_file>"
    exit 1
fi

dd if=$1 conv=sync,noerror bs=4M status=progress | gzip -c > $2
