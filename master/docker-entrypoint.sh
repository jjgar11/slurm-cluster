#!/bin/bash

sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf

sudo service munge start
sudo service slurmctld start

sudo mv /etc/slurm-llnl/test.py .
sudo chown admin:admin test.py
sudo mv /etc/slurm-llnl/job.sh .
sudo chown admin:admin job.sh
sudo chmod +x job.sh

tail -f /dev/null
