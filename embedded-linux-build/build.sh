#!/bin/sh

mkdir -p empty && docker build -f embedded-linux-build.Dockerfile -t embedded-linux-build empty/ && rmdir empty
