#!/bin/sh

IMAGE=lineage-build
HOST_DIR=/home/suresh/play/android
CONT_DIR=/home/dockr/android

docker run --rm -it -v ${HOST_DIR}:${CONT_DIR} ${IMAGE}
