FROM alpine:3.19.0
RUN apk update && apk add mariadb mariadb-client openrc

EXPOSE 3306
RUN mkdir -p /run/mysqld /var/lib/mysql && chown -R mysql:mysql /run/mysqld /var/lib/mysql
COPY ./conf/my.cnf /etc/my.cnf.d/my.cnf
RUN mariadb-install-db
COPY ./tools/init_database.sh /tmp/
RUN chmod +x /tmp/init_database.sh
CMD ["./tmp/init_database.sh"]