#!/bin/bash

service mariadb start 

sleep 5

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > create.sql
echo "CREATE USER IF NOT EXISTS '$DB_ROOT'@'%' IDENTIFIED BY '$DB_ROOT_PASS' ;" >> create.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO root@'%';" >> create.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;" >> create.sql
echo "GRANT SELECT, INSERT ON $DB_NAME.* TO '$DB_USER'@'%';" >> create.sql
echo "FLUSH PRIVILEGES;" >> create.sql

mysql < create.sql

# sleep 5

service mariadb stop

mysqld_safe