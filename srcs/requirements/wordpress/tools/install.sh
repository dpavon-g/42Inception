#!/bin/bash

# Creamos las carpetas para usar en el nginx posteriormente
mkdir /var/www/
mkdir /var/www/html

# Eliminamos todo lo que pueda haber dentro por si wordpress
# tuviera algo creado.
cd /var/www/html
rm -rf *

# Descargamos wordpress y lo descomprimimos dentro de html
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

wp theme install astra --activate --allow-root

wp plugin install redis-cache --activate --allow-root

mkdir /run/php

wp redis enable --allow-root

/usr/sbin/php-fpm7.3 -F