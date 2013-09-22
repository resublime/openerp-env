A configuraiton file named `.openerp_serverrc` needs to be created in `/home/openerp` in the container.
Copy `openerp.cfg.template` to `./home/openerp/.openerp_serverrc` and edit the settings.
It is primarily the database server ip that needs to be set (together with name and password if these have been changed) 
if the default configurations is ok.

Then build then container as usual: `docker build .`
