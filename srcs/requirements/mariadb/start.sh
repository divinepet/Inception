#!/bin/bash

echo "CREATE DATABASE ${WP_NAME};" > setup.sql
echo "CREATE USER '${WP_USER}'@'%' IDENTIFIED BY '${WP_PASS}';" >> setup.sql
echo "GRANT ALL PRIVILEGES ON ${WP_NAME}.* TO '${WP_USER}';" >> setup.sql
echo "FLUSH PRIVILEGES;" >> setup.sql

service mysql start && mysql < setup.sql
rm -f setup.sql
/usr/bin/mysqld_safe
