FROM php:7.4-apache

RUN a2enmod rewrite
COPY php/php.ini.dev $PHP_INI_DIR
# COPY php/php.ini.prod $PHP_INI_DIR
COPY apache/apache2.conf $APACHE_CONFDIR

WORKDIR /var/www/html
COPY src/public .