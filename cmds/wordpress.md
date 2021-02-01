browse wp server
www.<server>:80

browse wp server (admin)
www.<server>:80/wp-admin/

# ------------------------------------------------------------

FIND DEFAULT PASSWORD:

sudo cat /home/bitnami/bitnami_credentials

# ------------------------------------------------------------

Edit WP CONFIG:

nano ~/apps/wordpress/htdocs/wp-config.php

# ------------------------------------------------------------

wordpress salts should be the same on clustered servers that sit behind a load balancer.

salts can be viewed in wp-config.php found in link above.

There can be an ssl issue with wp servers that sit behind some loadbalancers (aws included).

# ------------------------------------------------------------

boot logs:
/opt/bitnami/var/log.

# ------------------------------------------------------------

LOGIN to phpMyAdmin

ssh -N -L 8888:127.0.0.1:80 -i KEYFILE bitnami@SERVER-IP

Access the phpMyAdmin console through the secure SSH tunnel you created, by browsing to:

http://127.0.0.1:8888/phpmyadmin


full details: https://docs.bitnami.com/aws/faq/get-started/access-phpmyadmin/

# ------------------------------------------------------------
