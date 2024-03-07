FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install php-fpm php-mysql -y

RUN apt-get install curl -y

COPY ./tools/install.sh /
# COPY ./tools/wp-config.php /

ENTRYPOINT ["/install.sh"]