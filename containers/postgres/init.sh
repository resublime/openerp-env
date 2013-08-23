#!/bin/bash

/bin/su postgres -c "/usr/lib/postgresql/9.1/bin/postgres -D /var/lib/postgresql/9.1/main -c config_file=/etc/postgresql/9.1/main/postgresql.conf" &
sleep 5
echo "CREATE ROLE openerp WITH SUPERUSER LOGIN PASSWORD 'openerp';SELECT rolname FROM pg_roles;\q"|/bin/su postgres -c "psql -U postgres"
