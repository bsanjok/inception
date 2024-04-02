FROM alpine:3.19.0
RUN apk update && apk add unzip lighttpd
RUN set -x && adduser -u 82 -D -S -G www-data www-data
WORKDIR /var/www/localhost/htdocs
COPY ./tools/htdocs /var/www/localhost/htdocs
COPY ./conf/lighttpd.conf /lighttpd.conf
RUN chown -R www-data:www-data /var/www/
EXPOSE 8082
CMD ["lighttpd", "-D", "-f", "/lighttpd.conf"]