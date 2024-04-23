FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
	apt install munge vim build-essential git mariadb-server wget curl -y
RUN apt install slurm-client sudo libopenmpi-dev -y
RUN apt install python3.9 python3-pip -y
RUN useradd -m admin -s /usr/bin/bash -d /home/admin && \
	echo "admin:admin" | chpasswd && \
	adduser admin sudo && \
	echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ADD slurm.conf /etc/slurm-llnl/slurm.conf
ADD cgroup.conf /etc/slurm-llnl/cgroup.conf
ADD docker-entrypoint.sh /etc/slurm-llnl/docker-entrypoint.sh
ADD requirements.txt /root/requirements.txt

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash -
RUN export NVM_DIR="$HOME/.nvm" && \
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
	nvm install 20 && \
	npm install -g configurable-http-proxy
RUN pip install -r /root/requirements.txt


EXPOSE 8888/tcp

ENV USER admin
ENV SHELL bash

WORKDIR /home/admin

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]