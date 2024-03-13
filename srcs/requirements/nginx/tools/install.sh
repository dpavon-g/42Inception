#!/bin/bash

# 1.    Genera el certificado autofirmado y la clave privada que se usaran para
#       cifrar y desencriptar las conexiones HTTPS.
# 1.1   req -x509, indicamos que queremos generar un certificado autofirmado en lugar de una solicitud de certificado.
# 1.2   -nodes, indicamos que no queremos cifrar la clave privada del certificado.
# 1.3   -days 365, establece la validez del certificado en días.
# 1.4   -newkey rsa:2048, especifica que deseas generar una nueva clave privada de este tipo.
# 1.5   -keyout ruta, establece la ruta donde vamos a generar la clave privada.
# 1.6   -out ruta, especifica donde y con que nombre se almacenará el certificado autofirmado.
# 1.7   -subj datos, establecemos el sujeto del certificado.
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $MY_PRIV -out $MY_CERT -subj "/C=ES/L=Madrid/O=ftef/OU=student/CN=dpavon-g.42.fr"

# 2.    Definimos la configuración para el sitio virtual de nginx que necesitará
#       variables de entorno.
# 2.1   mediante los dos primeros listen le especificamos que escuche 
#       conexiones tanto de IPv4 como de IPv4.
# 2.2   Establecemos que queremos que el servidor virtual responda a las solicitudes HTTPS
#       dirigidas a dos posibles nombres de dominio.
# 2.3   Especificamos la ubicación de la clave privada y del certificado autofirmado
#       que utilizará el servidor para cifrar y desencriptar las comunicaciones HTTPS.
echo -e "server {
    listen [::]:443 ssl;
    listen 443 ssl;

    server_name www.$DOMAIN $DOMAIN;

    ssl_certificate_key $MY_PRIV;
    ssl_certificate $MY_CERT;
" > /etc/nginx/sites-available/default

# 3.    Definimos la configuración para el sitio virtual de nginx que necesitará
#       variables de entorno.
# 3.1   Indicamos que el servidor solo aceptará conexiones seguras utilizando los protocolos
#       TLSv1.3 y TLSv1.2.
# 3.2   Establecemos que el servidor sea el que defina el cifrado de la conexión,
#       sin esta línea el cliente y el servidor tendrían que ponerse de acuerdo para ver
#       que cifrado usarían.
# 3.3   Establecemos que si no se especifica un archivo en la URL nginx intentará servir
#       el archivo index.php.
# 3.4   Define el directorio raíz donde se encuentran los archivos del sitio web.
#       (En este caso serían en /var/www/html)
# 3.5   Definimos el location que dirigirá las solicitudes que terminen en .php, seguidas
#       opcionalmente por una /. Así permitimos que Nginx dirija las solicitudes a PHP a través
#       de FastCGI.
echo -e '
    ssl_protocols TLSv1.3 TLSv1.2;
    ssl_prefer_server_ciphers on;

    index index.php;
    root /var/www/html;

    location ~ [^/]\.php(/|$) { 
            try_files $uri =404;
            fastcgi_pass wordpress:9000;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
} ' >> /etc/nginx/sites-available/default

# Iniciamos el servidor en primer plano (foreground) en lugar de en el fondo (background)
nginx -g "daemon off;"