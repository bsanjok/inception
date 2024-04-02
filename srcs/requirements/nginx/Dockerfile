FROM alpine:3.19.0
RUN apk update && apk add nginx openssl \
     && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/mykey.key -out /etc/ssl/certs/mycert.crt -subj "/C=DE/ST=BW/L=Heilbronn/O=42Heilbronn/OU=Cluster2/CN=sbhatta.42.fr"
COPY ./conf/default.conf /etc/nginx/http.d/
EXPOSE 443
# for bonus "adminer"
EXPOSE 8090
CMD ["nginx", "-g", "daemon off;"]
