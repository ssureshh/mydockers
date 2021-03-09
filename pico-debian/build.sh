#!/bin/sh

imagename="debian-minimal"

mkdir -p empty && docker build -f ${imagename}.Dockerfile -t ${imagename} empty/ && rmdir empty
