# Generated automatically by update.sh
# Do no edit this file

FROM php:5-apache

RUN apt-get update && apt-get install --yes --no-install-recommends \
    libssl-dev

RUN pecl install mongodb \
    && docker-php-ext-enable mongodb

RUN mkdir -p /conf.d \
    && echo "extension=mongodb.so" > /conf.d/mongodb.ini
