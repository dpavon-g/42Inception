#!/bin/bash

# Genera el certificado autofirmado y la clave privada que se usaran para
# cifrar y desencriptar las conexiones HTTPS
# req -x509, indicamos que queremos generar un certificado autofirmado en lugar de una solicitud de certificado.
# -nodes, indicamos que no queremos cifrar la clave privada del certificado.
# -days 365, establece la validez del certificado en días.
# -newkey rsa:2048, especifica que deseas generar una nueva clave privada de este tipo.
# -keyout ruta, establece la ruta donde vamos a generar la clave privada.
# -out ruta, especifica donde y con que nombre se almacenará el certificado autofirmado.
# -subj datos, establecemos el sujeto del certificado.
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $MY_PRIV -out $MY_CERT -subj "/C=ES/L=Madrid/O=ftef/OU=student/CN=dpavon-g.42.fr"

# Definimos la configuración para el sitio virtual de nginx
# mediante los dos primeros listen le especificamos que escuche 
# conexiones tanto de IPv4 como de IPv4.
# Establecemos que queremos que el servidor virtual responda a las solicitudes HTTPS
# dirigidas a dos posibles nombres de dominio.
# Por último especificamos la ubicación de la clave privada y del certificado autofirmado
# que utilizará el servidor para cifrar y desencriptar las comunicaciones HTTPS
echo "
server {
    listen [::]:443 ssl;
    listen 443 ssl;

    server_name www.$DOMAIN $DOMAIN;

    ssl_certificate_key $MY_PRIV;
    ssl_certificate $MY_CERT;
}" > /etc/nginx/sites-available/default

# Iniciamos el servidor en primer plano (foreground) en lugar de en el fondo (background)
nginx -g "daemon off;"
