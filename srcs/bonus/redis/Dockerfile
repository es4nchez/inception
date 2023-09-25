FROM alpine:latest

RUN apk add --no-cache redis

COPY redis.conf /usr/local/etc/redis/redis.conf

RUN mkdir -p /tmp && chmod 777 /tmp

# CMD ["/bin/sh"]

CMD sh -c "redis-server /usr/local/etc/redis/redis.conf && redis-cli -s /tmp/redis.sock monitor"
