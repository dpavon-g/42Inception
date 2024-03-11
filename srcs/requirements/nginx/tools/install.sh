#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out $MY_CERT -subj "/C=ES/L=Madrid/O=ftef/OU=student/CN=dpavon-g.42.fr"

echo $MY_CERT

# nginx -g "daemon off;"

/bin/bash