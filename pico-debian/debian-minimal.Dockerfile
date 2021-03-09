FROM debian:buster-slim

LABEL maintainer="Sureshkumar S <ssuresshhkk@gmail.com>"
LABEL date="01 MAR 2021"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
	sudo \
	git
RUN rm -rf /var/lib/apt/lists/* && apt-get clean

RUN groupadd -r -g 1000 dockr \
	&& useradd -r -m -s /bin/bash -g 1000 -u 1000 dockr 
RUN echo "dockr ALL=NOPASSWD:ALL" > /etc/sudoers.d/dockr

USER dockr
WORKDIR /home/dockr
CMD /bin/bash
