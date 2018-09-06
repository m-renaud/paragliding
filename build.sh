#! /bin/bash

OUTPUT_DIR="dist"
APP_JS="flightPlot.js"

mkdir -p ${OUTPUT_DIR}

rsync -av src/* "${OUTPUT_DIR}/"
