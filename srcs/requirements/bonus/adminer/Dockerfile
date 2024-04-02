FROM alpine:3.19.0
RUN apk update && apk add php82 php82-mysqli wget php82-pdo php82-session php82-fpm
WORKDIR /var/www/html
COPY ./tools/init_adminer.sh /tmp
COPY ./tools/index.php /var/www/html/index.php
COPY ./tools/adminer.css /var/www/html/adminer.css
RUN chmod +x /tmp/init_adminer.sh
RUN set -x && adduser -u 82 -D -S -G www-data www-data && \
    sed -i "s/listen = 127.0.0.1:9000/listen = 0.0.0.0:8000/" /etc/php82/php-fpm.d/www.conf
EXPOSE 8000
CMD ["/tmp/init_adminer.sh"]