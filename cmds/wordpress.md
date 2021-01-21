browse wp server
www.<server>:80

browse wp server (admin)
www.<server>:80/wp-admin/

# ------------------------------------------------------------

FIND DEFAULT PASSWORD:

sudo cat /home/bitnami/bitnami_credentials

# ------------------------------------------------------------

FIND WP CONFIG:

~/apps/wordpress/htdocs/wp-config.php

wordpress salts should be the same on clustered servers that sit behind a load balancer.

salts can be viewed in wp-config.php found in link above.

There can be an ssl issue with wp servers that sit behind some loadbalancers (aws included).



