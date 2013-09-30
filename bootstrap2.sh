#!/usr/bin/env bash

#
# This script installs the necessary stuff for the docker host.
# Images for the containers are built with Dockerfiles (see at the bottom)
#

sudo apt-get update

#
# Install docker.io
#

sudo apt-get install -y python-software-properties software-properties-common python-pip python-dev libevent-dev
sudo add-apt-repository ppa:dotcloud/lxc-docker
sudo apt-get update
sudo apt-get install -y lxc-docker

# Need to run docker with other flags, this file need to be updated once the machine is up
cp ./etc/init/docker.conf /etc/init


#
# Install redis, used by hipache and redis-dns
#

sudo apt-get install -y redis-server


#
# Nifty tools
#

sudo apt-get install -y git unzip s3cmd curl dkms postgresql-client-common postgresql-client-9.1


#
# Install NodeJs
#

sudo apt-get update -y
sudo apt-get install -y python g++ make software-properties-common
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update -y
sudo apt-get install -y nodejs


#
# Install CoffeeScript
#

sudo apt-get install -y coffeescript


#
# Install NodeJs Jacc
#

#sudo npm install jacc -g


#
# Install hipache and redis-dns directly instead of using Jacc
#

sudo npm install hipache -g --production
sudo npm install redis-dns -g --production

sudo cp ./usr/lib/node_modules/redis-dns/redis-dns-config.json /usr/lib/node_modules/redis-dns
ln -s /usr/lib/node_modules/redis-dns/bin/start.sh start-redis-dns



#
# Install grunt, used for nodejs development
#

sudo npm install grunt grunt-cli -g


# Use the local nameserver and then google's
# NOTE: sometimes usefull when using mobile broadband
#sudo sh -c 'echo "dns-nameservers localhost 8.8.8.8" >> /etc/network/interfaces'


#
# Clone this repo
#

cd ~
git clone https://github.com/colmsjo/openerp-env.git
