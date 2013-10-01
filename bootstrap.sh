#!/usr/bin/env bash

#
# This script installs the necessary stuff for the docker host.
# Images for the containers are built with Dockerfiles (see at the bottom)
#

sudo apt-get update

#
# Kernel upgrade
#

# 131001 JC, Added linux-headers-generic-lts-raring
sudo apt-get install -y linux-image-generic-lts-raring linux-headers-generic-lts-raring
sudo reboot
