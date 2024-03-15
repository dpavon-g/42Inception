FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install php-fpm php-mysql -y

RUN apt-get install default-mysql-client -y

RUN apt-get install curl -y

COPY ./tools/wp-config.php /wp-config.php
COPY ./tools/install.sh /

CMD ["/install.sh"]