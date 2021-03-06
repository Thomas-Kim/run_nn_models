#!/bin/bash

CWD=`pwd`
DIR=`basename $CWD`

prog() {
    cd tf_nets

    wget http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_coco_11_06_2017.tar.gz
    tar -xvf ssd_mobilenet_v1_coco_11_06_2017.tar.gz

    rm ssd_mobilenet_v1_coco_11_06_2017.tar.gz
    mv ssd_mobilenet_v1_coco_11_06_2017 ssd_mobilenet_v1_coco

    cd $CWD

    if [ ! -d projects/utils ]; then
        mkdir projects/utils
    fi
    if [ ! -f projects/utils/__init__.py ]; then
        touch projects/utils/__init__.py
    fi
    cp models/research/object_detection/utils/visualization_utils.py projects/utils
}

if [[ "$DIR" != "run_nn_models" ]] && [[ "$1" != "-f" ]];
then
    echo "Warning: you must run this script from the run_nn_models repo root, and I don't think you are."
    echo "Run this again with -f if you're sure."
else
    prog
fi
