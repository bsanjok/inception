FROM alpine:3.19.0
RUN apk update && apk add vsftpd openrc
COPY ./tools/ftp_init.sh /tmp/ftp_init.sh
RUN chmod +x /tmp/ftp_init.sh && mkdir /var/log/vsftpd && touch /var/log/vsftpd/vsftpd.log
COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
EXPOSE 20 21 21100-21100
CMD ["/tmp/ftp_init.sh"]