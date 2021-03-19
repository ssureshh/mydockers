#!/bin/sh

imagename="pico-dev"

mkdir -p empty && docker build -f ${imagename}.Dockerfile -t ${imagename} empty/ && rmdir empty
