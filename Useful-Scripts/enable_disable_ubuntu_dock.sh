#!/bin/bash

## Vahe Danielyan 2021 WTFPL Licence
## disables ubuntu dock, useful if "dash to dock" is installed
## moves the ubuntu dock extention to a .bak file, to be able to restore later

if [ $# -ne 1 ]
then
    echo "Usage: ./enable_disable_ubuntu_dock.sh <arg1>"
    echo  "<arg1> = -e for enable, -d for disable"
    return
fi

if [[ $1 == "-d" ]]
then
    cd /usr/share/gnome-shell/extensions/
    sudo mv ubuntu-dock@ubuntu.com{,.bak}
    if [ $? -ne 0 ]
    then
        echo "Error, please check the message above"
    else
        echo "Disabled ubuntu dock extention"
    fi
else
    if [[ $1 = "-e" ]]
    then
        cd /usr/share/gnome-shell/extensions/
        sudo mv ubuntu-dock@ubuntu.com{.bak,} 
        if [ $? -ne 0 ]
        then
            echo "Error, please check the message above"
        else 
            echo "Enabled ubuntu dock extention"
        fi
    fi
fi

## EOF
