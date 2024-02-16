#!/bin/bash

echo "CREATE DATABASE IF NOT EXISTS dpavon_db;" > create.sql
echo "CREATE USER IF NOT EXISTS 'user_db'@'%' IDENTIFIED BY 'pass_db' ;" >> create.sql
echo "GRANT ALL PRIVILEGES ON root.* TO user_db@'%';" >> create.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpass' ;" >> create.sql
echo "CREATE USER IF NOT EXISTS 'dpavon-g'@'%' IDENTIFIED BY '12345' ;" >> create.sql
echo "GRANT SELECT, INSERT PRIVILEGES ON dpavon-g.* TO user_db@'%';" >> create.sql
echo "FLUSH PRIVILEGES;" >> create.sql

mysql < create.sql

kill -SIGTERM $(cat /var/run/mysqld/mysqld.pid)

mysqld