FROM alpine:latest AS build

RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=CH/ST=Vaud/L=./CN=localhost' -keyout nginx-selfsigned.key -out nginx-selfsigned.crt


FROM alpine:latest

COPY --from=build nginx-selfsigned.key nginx-selfsigned.crt .

RUN apk add nginx

COPY conf/nginx.conf /etc/nginx/http.d/default.conf

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443
