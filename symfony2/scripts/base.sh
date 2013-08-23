#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

mv /tmp/sources.list /etc/apt/sources.list
wget http://www.dotdeb.org/dotdeb.gpg -O - | apt-key add -
wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc -O - | apt-key add -

apt-get update

apt-get -qy install \
    nginx \
    php5-fpm \
    php5-cli \
    php5-pgsql \
    php5-intl \
    php5-xhprof \
    postgresql-9.2 \
    postgresql-client-9.2 \
    rabbitmq-server \
    daemontools-run

cp /tmp/nginx.conf /etc/nginx/sites-available/default

cp /tmp/php.ini /etc/php5/cli/php.ini
cp /tmp/php.ini /etc/php5/fpm/php.ini

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
