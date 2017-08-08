#!/bin/sh
echo 'Initialization database...'

service mysql start
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE discovery"

mysql -uroot -p$MYSQL_ROOT_PASSWORD discovery < createdb.sql

mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT SELECT ON discovery.* TO 'root'@'%' IDENTIFIED BY 'root'; FLUSH PRIVILEGES"

echo 'Database initialized'
