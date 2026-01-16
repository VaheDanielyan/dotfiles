#!/bin/bash

function run_matlab() {
    unset QT_SCREEN_SCALE_FACTORS
    unset QT_AUTO_SCREEN_SCALE_FACTOR
    unset QT_ENABLE_HIGHDPI_SCALING
    export ENABLE_QWEBWINDOW=true; QT_QPA_PLATFORM=xcb; /home/daniev/.local/MATLAB/R2025b/bin/matlab
    sleep 10
}

function kill_matlab() {
    pkill -9 matlab
}

pushd /home/daniev/
run_matlab
#kill_matlab
#run_matlab

