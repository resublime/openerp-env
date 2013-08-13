Development environement for OpenERP
====================================

Linux containers is a nice tecnnology that is increasing in popularity. Below are instructions
for hotwo get started running OpenERP on CoreOS which is using docker containers. See README-OSX.md
for instruction about howto install on OSX.


Pre-requisite:

 * VirtualBox
 * vagrant, see vagrantup.com


Installation:

1. `vagrant up coreos` - create and start a virtual machine - it is also possible to use ubuntu `vagrant up ubuntu` 
1. `vagrant ssh coreos` - login to the virtual machine - for ubuntu do `vagrant ssh ubuntu`
1. Start with creating a container that simplfies the management of CoreOOS: `JACC=$(docker run -d colmsjo/jacc)`
1. `docker ps` will show the containers running. $JACC has the ID for the container just created.
1. Get the IP for the new container: `docker inspect $JACC
 * This will save the IP in a variable: `CONTAINER_IP=$(docker inspect $JACC | grep IPAddress | awk '{ print $2 }' | tr -d ',"')`
1. Now do `ssh root@$CONTAINER_IP`. The password is 'jacc'





