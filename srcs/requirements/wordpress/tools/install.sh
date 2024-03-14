#!/bin/bash

# Creamos si no existen los directorios donde estará alojado nuestro WordPress
mkdir /var/www/
mkdir /var/www/html

cd /var/www/html

# Eliminamos todo lo que haya dentro por si existía y tenía algo dentro
# (Puede ser ya que está dentro de un volumen y guarda los datos)
rm -rf *

# Descargamos e instalamos el configurador de WordPress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root

#TODO: Ver porque tengo que hacer esto de esta forma.
# Movemos el archivo de configuración de WordPress que hemos escrito al directorio 
# donde van a estar nuestras páginas web.
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
mv /wp-config.php /var/www/html/wp-config.php

# Modificamos el archivo de configuración para que tenga la las credenciales que necesitamos
# para que la instalación funcione.
sed -i -r "s/database/$DB_NAME/1"   wp-config.php
sed -i -r "s/user/$DB_ROOT/1"  wp-config.php
sed -i -r "s/password/$DB_ROOT_PASS/1"    wp-config.php
sed -i -r "s/localhost/mariadb/1"    wp-config.php

sleep 1

# Usamos el configurador de WordPress de línea de comandos para instalar el servicio.
wp core install --url=$DOMAIN/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS\
 --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create "${WP_ADMIN_USER}" "${WP_EMAIL}" --user_pass="${WP_PASS}" --role=author

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# Creamos la carpeta que utilizará fastCGI para intentar crear el socket UNIX
mkdir /run/php
/usr/sbin/php-fpm7.4 -F