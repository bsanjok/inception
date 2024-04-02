#!/bin/sh
set -a
[ -f .env ] && . .env
set +a
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
echo "FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PWD}';
GRANT ALL PRIVILEGES on ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;" > /tmp/initdb.sql
cd /tmp/
mariadbd --user=mysql --bootstrap < initdb.sql;
rm -f initdb.sql
else
    echo "Database exists! Skipping create database script"
fi
mariadbd --user=mysql
