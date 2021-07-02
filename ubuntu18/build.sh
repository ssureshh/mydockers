#!/bin/sh

imagename="ubuntu18"
dkr_uid=$(id -u)
dkr_gid=$(id -g)
dkr_user="dockr"

mkdir -p empty && docker build --no-cache -f ${imagename}.Dockerfile --build-arg UID=${dkr_uid} --build-arg GID=${dkr_gid} --build-arg USER=${dkr_user} -t ${imagename} empty/ && rmdir empty
