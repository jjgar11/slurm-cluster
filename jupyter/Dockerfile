FROM ubuntu:20.04

RUN apt update -y && apt install munge -y && apt install vim -y && apt install build-essential -y && apt install git -y && apt-get install mariadb-server -y && apt install wget -y

ARG DEBIAN_FRONTEND=noninteractive
RUN apt install slurm-client -y
RUN apt install sudo -y && apt install python3.9 python3-pip -y && \
	useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN apt update -y && apt install npm nodejs -y && npm install -g configurable-http-proxy && pip3 install jupyterlab==4.1.6 && pip3 install jupyterlab_slurm

RUN python3 -m pip install jupyterlab-slurm

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/

WORKDIR /home/admin

EXPOSE 8888

ENV USER admin
ENV SHELL bash

RUN apt install libopenmpi-dev -y && pip3 install mpi4py

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
