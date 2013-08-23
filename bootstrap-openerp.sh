#!/usr/bin/env bash

#
# This script sets up what's needed for OpenERP
#

cd ~
git clone https://github.com/colmsjo/open-erp.git


#
# Start a postgres container at boot
#

sudo cp ./etc/init/docker-postgres.conf /etc/init


#
# Start a python container with OpenERP at boot
#

sudo cp ./etc/init/docker-openerp.conf /etc/init


