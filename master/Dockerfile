FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
	apt install munge vim build-essential git mariadb-server wget sudo libopenmpi-dev -y

RUN apt install slurmd slurm-client slurmctld -y
RUN apt install python3.9 python3-pip -y
RUN useradd -m admin -s /usr/bin/bash -d /home/admin && \
	echo "admin:admin" | chpasswd && \
	adduser admin sudo && \
	echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN pip3 install mpi4py

ADD slurm.conf /etc/slurm-llnl/slurm.conf
ADD cgroup.conf /etc/slurm-llnl/cgroup.conf
ADD docker-entrypoint.sh /etc/slurm-llnl/docker-entrypoint.sh

ADD test.py /etc/slurm-llnl/test.py
ADD job.sh /etc/slurm-llnl/job.sh

EXPOSE 6817/tcp 6818/tcp 6819/tcp 3306/tcp

WORKDIR /home/admin

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
