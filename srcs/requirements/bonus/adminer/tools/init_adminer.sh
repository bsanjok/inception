#!/bin/sh

cd /var/www/html/
chown -R www-data:www-data /var/www/html/
php-fpm82 -F
# php -S 0.0.0.0:9001