FROM alpine:3.19.0
RUN apk update && apk add wget php82 \
    php82-json php82-pdo_mysql php82-mysqli php82-curl php82-dom php82-exif php82-fileinfo \
    php82-intl php82-mbstring php82-openssl php82-phar php82-tokenizer php82-ctype\
    php82-xml php82-zip php82-redis php82-fpm php82-cli php82-pdo php82-fpm
WORKDIR /var/www/html
COPY ./tools/init_wordpress.sh /tmp/init_wordpress.sh
RUN set -x && adduser -u 82 -D -S -G www-data www-data
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar /tmp/init_wordpress.sh && \
    mv wp-cli.phar /usr/local/bin/wp && \
    sed -i "s/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/" /etc/php82/php-fpm.d/www.conf && \
    wp core download --path=/var/www/html/ --version=6.4.2
RUN touch /var/log/php82/error.log && chown -R www-data:www-data /var/www/html/ && chown -R www-data:www-data /var/log/php82/error.log
USER www-data
EXPOSE 9000
CMD ["/tmp/init_wordpress.sh"]
