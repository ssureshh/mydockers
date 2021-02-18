FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
        bc \
        bison \
        build-essential \
        ca-certificates \
        device-tree-compiler \
        file \
        flex \
        gawk \
        gettext \
        git \
        g++-multilib \
        grep \
        libncurses5-dev \
        libncurses5-dev \
        libssl-dev \
        libssl-dev \
        lzop \
        perl \
        python3 \
        python3-dev \
        python3-distutils \
        python3-pip \
        python3-pyelftools \
        python3-setuptools \
        python3-wheel \
        subversion \
        swig \
        time \
        unzip \
        xxd \
        zlib1g-dev

RUN pip3 install pycrypto
RUN ln -fs /usr/bin/python3 /usr/bin/python

RUN rm -rf /var/lib/apt/lists/* && apt-get clean

# mkdir empty && docker build -f tvbox.Dockerfile -t tvbox.debian-buster empty/ && rmdir empty

LABEL maintainer="Sureshkumar S <ssureshhkk@gmail.com>"
LABEL date="18 FEB 2021"

RUN groupadd -g 1000 dockr && useradd -g 1000 -u 1000 dockr
USER dockr
WORKDIR /home/dockr
CMD /bin/bash
