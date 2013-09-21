Development environement for OpenERP
====================================

Linux containers is a nice tecnnology that is increasing in popularity. Below are instructions
for hotwo get started running OpenERP on CoreOS which is using docker containers. See README-OSX.md
for instruction about howto install on OSX.


Pre-requisite:

 * VirtualBox
 * vagrant, see vagrantup.com


Installation:

1. `vagrant up ubuntu` - create and start a virtual machine - it is also possible to use coreos `vagrant up coreos` 
1. `vagrant ssh ubuntu` - login to the virtual machine - for coreos do `vagrant ssh coreos`

It will take some time to download everything the first time. Starting the virtual machine and
new continers is quickly done once they've been downloaded.

`jacc` is used for deploying new containers. Just do `jacc --cmd help` for instructions. Containers are defined using a Dockerfile,
see http://docs.docker.io/en/latest/use/builder/ for more information.


## Configuration

docker need to be configured to open up the HTTP API. The start script needs to look something like this `exec /usr/bin/docker -d -H 127.0.0.1:4243`.
For ubuntu, this is changed in `/etc/init/docker.conf`. Now the docker command line tool needs the flag `-H=tcp://127.0.0.1:4242`. Create
an alias for simplcity: `alias docker='docker -H=tcp://127.0.0.1:4243'`. Place this in your `.profile` etc.


### DNS server

DNS server to use in order to access Postgres using a name rather that an IP: `sudo npm install -g redis-dns --production`

Setup:

 * `cd /usr/lib/node_modules/redis-dns`
 * `sudo cp redis-dns-config.json.template redis-dns-config.json`
 * `sudo nano redis-dns-config.json` - update with your settings, change the DNS port to 53

Check that the redis server is running: `sudo service redis-server status`

Start the server with: `sudo sh -c 'node server.js > /var/log/redis-dns.log 2>&1 &'`

Check the log: `sudo cat /var/log/redis-dns.log`


Test:

 * Configure the server like this: `redis-cli set redis-dns:dbserver 172.17.42.100`
 * Check what the DNS server says: `dig @localhost dbserver`


### Postgres

 * `cd ~/openerp-env/containers/postgres`
 * `docker ps -a`
 * `docker build .`
 * `docker images`
 * `docker run -d c9b30338b944`
 * `docker ps`
 * `docker logs ...`


### hipache

`sudo npm install -g hipache`


## For CoreOS

1. Start with creating a container that simplfies the management of CoreOOS: `JACC=$(docker run -d colmsjo/jacc /usr/sbin/sshd -D -e -f /etc/ssh/sshd_config)`
1. `docker ps` will show the containers running. $JACC has the ID for the container just created.
1. Get the IP for the new container: `docker inspect $JACC
 * This will save the IP in a variable: `CONTAINER_IP=$(docker inspect $JACC | grep IPAddress | awk '{ print $2 }' | tr -d ',"')`
1. Now do `ssh root@$CONTAINER_IP`. The password is 'jacc'


Configure Jacc:

1. Show the IP adress of the virtual machine: `ifconig`
1. Enter the adress in the jacc configuration in the jacc container: `nano /usr/lib/node_modules/jacc/jacc_config.json`


Start redis: `service redis start`

Enable CORS in docker: update `/etc/init/docker.conf` with someting like `docker -d -H=”tcp://192.168.1.9:4243” -api-enable-cors`

