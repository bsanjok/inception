#!/bin/sh
cd /var/www/html
wp config create --url=$DOMAIN --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD --dbhost=mariadb:3306
wp core install --url=$DOMAIN --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email
wp option update home $URL && wp option update siteurl $URL
wp user create $WP_AUTHOR_USER $WP_AUTHOR_EMAIL --role=author --user_pass=$WP_AUTHOR_PWD
wp config set WP_REDIS_PORT 6379
wp config set WP_CACHE true
wp config set WP_REDIS_HOST redis
wp config set WP_CACHE_KEY_SALT $DOMAIN
wp config set WP_REDIS_CLIENT phpredis
wp plugin install redis-cache --activate && wp redis enable
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
chown -R www-data:www-data /var/www/html
php-fpm82 -F