FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y 

RUN apt-get install mariadb-server -y

COPY ../requirements/mariadb/tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ../requirements/mariadb/tools/create.sh /

EXPOSE 3306

CMD [ "/create.sh" ]