FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y 

RUN apt install -y nginx && apt install openssl -y

RUN sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
    /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt \
    -subj "/C=ES/ST=Madrid/L=42 Madrid/O=42 Network, Inc./OU=42/CN=yourdomain.com"

EXPOSE 80

