FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y 

RUN apt-get install mariadb-server -y
RUN apt-get install mariadb-client -y

COPY ../requirements/mariadb/tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ../requirements/mariadb/tools/create.sh /

RUN chmod +x /create.sh

EXPOSE 3306

ENTRYPOINT ["/create.sh" ]