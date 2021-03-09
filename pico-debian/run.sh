#!/bin/sh

IMAGE=debian-minimal
HOST_DIR=/home/suresh/play/pico-dev
CONT_DIR=/home/dockr/pico-dev

docker run --rm -it -v ${HOST_DIR}:${CONT_DIR} ${IMAGE}
