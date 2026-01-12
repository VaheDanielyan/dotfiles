#!/bin/bash

function run_matlab() {
    export ENABLE_QWEBWINDOW=true; QT_QPA_PLATFORM=xcb; matlab
    sleep 10
}

function kill_matlab() {
    pkill -9 matlab
}

pushd /home/daniev/
run_matlab
#kill_matlab
#run_matlab

