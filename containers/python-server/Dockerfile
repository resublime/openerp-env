#
# Dockerfile that builds container with nodejs and Python
# When not using vagrant, run it manually with: docker build - < Dockerfile.nodejs
#


# Image: Python for OpenERP
#
# VERSION               0.0.1

FROM     ubuntu
MAINTAINER Jonas Colmsjö "jonas@gizur.com"


# -----------------------------------------------------------------------------------
# PREPARATIONS 
#

# sudo will complain about unknown host otherwise
RUN echo "127.0.0.1\t`hostname`" >> /etc/hosts

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update -y


#
# Install some nice tools
#

RUN apt-get install -y git wget


#
# Install Python and virutalenv
#

RUN apt-get install -y build-essential python2.7-dev python-setuptools
RUN easy_install pip
RUN pip install virtualenv

# Install some dependensices (the OpenERP list)
RUN apt-get install -y python-dateutil python-feedparser python-ldap python-libxslt1 python-lxml python-mako python-openid python-psycopg2 python-reportlab python-simplejson python-tz python-vobject python-werkzeug python-yaml


# Create Python environment
RUN /usr/local/bin/virtualenv /venv --distribute

# Bundle app source
ADD . /venv/src

# Install OpenERP
RUN source /venv/bin/activate; cd /venv/src/openerp-7.0-20130603-231132; python setup.py install


# Start OpenERP
EXPOSE  8080
CMD ["/venv/bin/activate;/venv/bin/openerp-server"]
