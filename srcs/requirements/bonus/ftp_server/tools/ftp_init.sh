#!/bin/sh

mkdir -p /var/www/ftp
adduser -D $FTP_USER
echo -e "$FTP_USER:$FTP_USER_PWD" | /usr/sbin/chpasswd
chown -R $FTP_USER:$FTP_USER /var/log/vsftpd
chown -R $FTP_USER:$FTP_USER /var/www/ftp
echo "$FTP_USER" | tee -a /etc/vsftpd/vsftpd.userlist
# rc-service vsftpd stop
vsftpd /etc/vsftpd/vsftpd.conf