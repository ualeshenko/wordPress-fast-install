# wordpress-fast-install
WordPress Fast Install

  The script allows you to customize the working environment for installation, WordPress settings.

Working only with Ubuntu.

Setting up:
- wordpress
- apache2
- nginx
- php7.3
- mysql
- bind9
- connect to dnsmanager
- ssl
- ufw
- certbot (ssl letsencrypt )

Options:
- --domain - allows you to specify a domain that will be configured for apache2, nginx, wordpress, sql ...
- --locale - using the option --locale allows you to specify the used locale in wordpress
- --wp-password - password on the wordpress admin panel
- --user_dnsmgr - user dnsmanager
- --pass_dnsmgr - password dnsmanager 
- --domain1_dnsmgr - domain dnsmanager №1
- --domain2_dnsmgr - domain dnsmanager №2

Example:
- ./wordpress_script.sh --domain=example.com --wp-password=secret
- bash wordpress_script.sh --domain=example.com --wp-password=secret 
- ./wordpress_script.sh  --domain=example.com --wp-password=secret --user_dnsmgr=user1 --pass_dnsmgr=secret --domain1_dnsmgr=dnsmgr1.example.com --domain2_dnsmgr=dnsmgr2.example.com --dnsmgr

#SSL 

  If the A-record of the domain example.com points to the server, then WordPress will be installed and configured with ssl, if there is no domain or the A-record does not indicate on the server, then WordPress will be configured and raised using the IP server (http://101.168 74.102). In the future, if you want to connect ssl, you must run the script with the options --domain=example.com, --ssl, after that you will receive ssl certificates and set up ssl for wordpress.
  Example:

- ./wordpress_script.sh --domain=example.com --ssl








