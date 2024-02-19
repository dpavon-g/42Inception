#!/bin/bash
sleep 5

service mariadb start 

echo "CREATE DATABASE IF NOT EXISTS dpavon_db;" > create.sql
echo "CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'rootpass' ;" >> create.sql
echo "GRANT ALL PRIVILEGES ON dpavon_db.* TO root@'%';" >> create.sql
echo "CREATE USER IF NOT EXISTS 'dpavon-g'@'%' IDENTIFIED BY '12345' ;" >> create.sql
echo "GRANT SELECT, INSERT ON dpavon_db.* TO 'dpavon-g'@'%';" >> create.sql
echo "FLUSH PRIVILEGES;" >> create.sql

mysql < create.sql

service mariadb stop

sleep 10

mysqld