FROM debian:buster-slim

LABEL maintainer="Sureshkumar S <ssuresshhkk@gmail.com>"
LABEL date="01 MAR 2021"

ARG UID=1000
ARG GID=1000
ARG USER="dockr"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get upgrade -y

#RUN apt-get install -y --no-install-recommends <insert package names>
#RUN rm -rf /var/lib/apt/lists/* && apt-get clean

RUN groupadd -g $GID $USER && useradd -g $GID -u $UID $USER
USER $USER
WORKDIR /home/workdir
CMD /bin/bash
