FROM debian:buster-slim

LABEL maintainer="Sureshkumar S <ssuresshhkk@gmail.com>"
LABEL date="01 MAR 2021"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
	sudo \
	git \
	vim \
	build-essential \
	python3 \
	cmake \
	gcc-arm-none-eabi \
	libnewlib-arm-none-eabi
RUN apt-get install -y --no-install-recommends ca-certificates
RUN apt-get install -y --no-install-recommends wget
RUN rm -rf /var/lib/apt/lists/* && apt-get clean

RUN groupadd -r -g 1000 dockr \
	&& useradd -r -m -s /bin/bash -g 1000 -u 1000 dockr 
# RUN echo "dockr ALL=NOPASSWD:ALL" > /etc/sudoers.d/dockr
USER dockr
WORKDIR /home/dockr
RUN git clone --recurse-submodules https://github.com/raspberrypi/pico-sdk.git
RUN echo "export PICO_SDK_PATH=/home/dockr/pico-sdk" >> ~/.bashrc
RUN wget https://raw.githubusercontent.com/ssureshh/learn_rp2040_pico/main/create_project.sh
RUN chmod +x create_project.sh
CMD /bin/bash
