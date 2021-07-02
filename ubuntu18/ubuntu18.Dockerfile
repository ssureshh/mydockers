FROM ubuntu:18.04

LABEL maintainer="Sureshkumar S <ssuresshhkk@gmail.com>"
LABEL date="02 JUL 2021"

ARG UID=1000
ARG GID=1000
ARG USER="dockr"

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
	sudo \
	vim \
	git
RUN rm -rf /var/lib/apt/lists/* && apt-get clean

RUN groupadd -r -g $GID dockr 
RUN useradd -r -m -s /bin/bash -g $GID -u $UID dockr
RUN echo "dockr ALL=NOPASSWD:ALL" > /etc/sudoers.d/dockr

USER $USER
WORKDIR /home/$USER
CMD /bin/bash
