#!/bin/sh

IMAGE=lineage-build
HOST_DIR=/home/suresh/play/lineage
CONT_DIR=/home/dockr/lineage

docker run --rm -it -v ${HOST_DIR}:${CONT_DIR} ${IMAGE}
