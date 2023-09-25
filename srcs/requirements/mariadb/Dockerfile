FROM alpine:latest

RUN apk add mariadb \
	mariadb-client \
	curl \
	zsh \
	git \
	nano


COPY my.cnf /etc/mysql/
COPY my.cnf /etc/my.cnf
COPY "./init_db.sh" .

ENTRYPOINT ["./init_db.sh"]