#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_gz_file> <dest_drive>"
    exit 1
fi

gunzip -c $1 | dd of=$2 bs=32M status=progress
