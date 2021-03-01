#!/bin/sh

DOCKERFILE="lineage-build.Dockerfile"
TARGETIMAGE="lineage-build"
uid=$(id -u)
gid=$(id -g)

mkdir -p empty && docker build -f ${DOCKERFILE} --build-arg UID=${uid} --build-arg GID=${gid} -t ${TARGETIMAGE} empty/ && rmdir empty
