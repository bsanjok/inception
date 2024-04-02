FROM alpine:3.19.0
RUN apk update && apk add redis
RUN echo "maxmemory 256mb" >> /etc/redis.conf && echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf
RUN sed -i "s/bind 127.0.0.1/#bind 127.0.0.1/" /etc/redis.conf
# RUN echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf && sysctl vm.overcommit_memory=1
EXPOSE 6379
CMD ["redis-server", "--protected-mode", "no"]