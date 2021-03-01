#!/bin/sh

IMAGE=debian-minimal
HOST_DIR=/home/suresh/play/tvbox
CONT_DIR=/home/dockr/tvbox

docker run --rm -it -v ${HOST_DIR}:${CONT_DIR} ${IMAGE}