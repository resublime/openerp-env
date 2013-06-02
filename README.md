Development setup for Python and OpenERP
===================================================


Preparations
------------

First create a Python virtual environment using virtualenv:

```
# python-env is a suggested name, any name can be used
virtualenv sbx
```

```
cp requirements.txt sbx && cd sbx
./bin/pip install -r requirements.txt

# Install Pychart manually, pip is broken
mkdir src && cd src
wget http://download.gna.org/pychart/PyChart-1.39.tar.gz
tar -xzf PyChart-1.39.tar.gz 
brew install ghostscript
../../bin/python setup.py install


# Need to fix the PIL installation
cd lib/python2.7/site-packages/
ln -s PIL-1.1.7-py2.7-macosx-10.8-intel.egg PIL

cd ..
```


Postgres:

```
# see details below
brew install postgres
initdb /usr/local/var/postgres -E utf8
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
export PGDATA=/usr/local/var/postgres/
pg_ctl status
```

Create a postgres user

```
createuser openerp
psql -l
psql template1
alter role openerp with password 'postgres';
```


Install OpenERP
--------------


```
wget http://nightly.openerp.com/7.0/nightly/src/openerp-7.0-latest.tar.gz
tar -xvzf openerp-7.0-latest.tar.gz
cd openerp
../bin/python setup.py install
```




Misc stuff
---------

List available fabfile commands:

```
./python-env/bin/fab -f ./fabfile.py -l
```

This alias is usefull to have:

```
# Define a alias for fab, you need to be in the repo root folder to run it
# Add this to your bashrc (or other shell rc) file 
alias fab='./python-env/bin/fab -f ./fabfile.py'

# Now just run fab
fab list
```



