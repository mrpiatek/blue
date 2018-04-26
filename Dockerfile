# Based on hitalos/laravel

FROM php:alpine

RUN apk update && apk upgrade && apk add bash git

ADD ./install-php.sh /usr/sbin/install-php.sh
RUN /usr/sbin/install-php.sh

RUN mkdir -p /etc/ssl/certs && update-ca-certificates

WORKDIR /var/www
EXPOSE 8000
HEALTHCHECK --interval=1m CMD curl -f http://localhost/ || exit 1