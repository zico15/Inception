#!/bin/bash
sed -i "s/MARIADB_PASSWORD/$MARIADB_PASSWORD/g" /etc/mysql/conf.d/db_script.sql && \
sed -i "s/MARIADB_ROOT_PASSWORD/$MARIADB_ROOT_PASSWORD/g" /etc/mysql/conf.d/db_script.sql && \
sed -i "s/MARIADB_DATABASE/$MARIADB_DATABASE/g" /etc/mysql/conf.d/db_script.sql && \
sed -i "s/MARIADB_USER/$MARIADB_USER/g" /etc/mysql/conf.d/db_script.sql
service mysql start 2>/dev/null
sleep 1
mariadb  < /etc/mysql/conf.d/db_script.sql 2>/dev/null
sleep 1

echo "DELETE FROM mysql.user WHERE User='root'; FLUSH PRIVILEGES;" | mariadb -u$MARIADB_USER -p$MARIADB_ROOT_PASSWORD 2>/dev/null

sleep 1
kill -9 $(ps aux | grep mysql | awk '{ print $2}') 2>/dev/null
sleep 1
mysqld_safe --bind-address=0.0.0.0