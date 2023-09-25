FROM alpine:latest

RUN	apk update && apk upgrade && apk add --no-cache \
        vsftpd

COPY vsftpd.conf /tmp/vsftpd.conf

COPY entrypoint.sh /tmp/configure.sh

ENTRYPOINT ["sh", "/tmp/configure.sh"]