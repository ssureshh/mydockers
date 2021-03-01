FROM ubuntu:18.04
MAINTAINER Suresh

ARG UID=1000
ARG GID=1000

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get purge openjdk-* icedtea-* icedtea6-*
RUN apt-get install -y \
	openjdk-8-jdk \
	bison \
	ccache \
	g++-multilib \
	git \
	git-lfs \
	gperf \
	libxml2-utils \
	make \
	zlib1g-dev:i386 \
	zip \
	liblz4-tool \
	libncurses5 \
	libssl-dev \
	bc \
	flex \
	curl \
	python \
	python3 \
	python3-pip \
	rsync \
	vim \
	python-protobuf \
	sudo \
	wget

RUN pip3 install -U protobuf
RUN curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /bin/repo
RUN chmod a+x /bin/repo

RUN groupadd -r -g $GID dockr
RUN useradd -r -m -s /bin/bash -g $GID -u $UID dockr
RUN echo "dockr ALL=NOPASSWD:ALL" > /etc/sudoers.d/dockr
USER dockr
WORKDIR /home/dockr

RUN git config --global user.name "Suresh"
RUN git config --global user.email "suresh241098@gmail.com"
