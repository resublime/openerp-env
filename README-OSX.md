Development setup for Python and OpenERP
========================================



Preparations on OSX
------------------

First create a Python virtual environment using virtualenv:

```
virtualenv venv --distribute
source venv/bin/activate
```

```
pip install -r requirements.txt
```

Fix due to problems with PyChart on OSX

```
# Install Pychart manually, pip is broken
cd PyChart
python setup.py install
brew install ghostscript
```

Fix due to problems with PIL on OSX

```
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


Install OpenERP on OSX
---------------------


Make sure that `source venv/bin/activate` has been executed (or the instllation will be performed globally and not in the virtual environment)

```
cd openerp-7.0-20130603-231132
python setup.py install
```


Running OpenERP
-------------

Start Postgres and then OpenERP.

```
# start Postgres if it's no started
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
export PGDATA=/usr/local/var/postgres/
pg_ctl status


# Make sure the right python environment is used
source venv/bin/activate
./venv/bin/openerp-server
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



