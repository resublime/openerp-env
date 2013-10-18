Development environement for OpenERP
====================================

Use this repo to setup docker: https://github.com/colmsjo/docker.git

Setup Postgres in docker
-----------------------

 * `cd ~/openerp-env/containers/postgres`
 * `docker ps -a`
 * `docker build -no-cache -rm .`
 * `docker images` - show images
 * `docker run -d [Image ID]`
 * `docker ps` - get the ID of the container 
 * `docker logs [ID]`
 * `docker inspect [ID] | grep IPAddress` - show the IP adress of the container
 * `redis-cli set redis-dns:postgres [IPAddress]` - Update the DNS server with the IP adress
 * `dig @localhost postgres` - check that it works


Setup OpenERP Python App Server in docker
-----------------------------------------

```
cd ~/openerp-env/containers/python-server
cat README.md 
```

This needs to be configured according to the README above:

```
cp openerp.cfg.template ./home/openerp/.openerp_serverrc
nano ./home/openerp/.openerp_serverrc

docker build -no-cache -rm .
```

Start the container:

```
docker run -d -dns=172.17.42.1 [ID]
```


