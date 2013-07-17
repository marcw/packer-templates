#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

apt-get -q -y install \
    nginx \
    php5-fpm \
    php5-cli \
    php5-mysqlnd \
    php5-redis \
    redis-server \
    rabbitmq-server \
    mysql-client \
    mysql-server \
    mongodb-server \
    git \
    vim \
    curl

cp /tmp/nginx.conf /etc/nginx/sites-available/default

cp /tmp/php.ini /etc/php5/cli/php.ini
cp /tmp/php.ini /etc/php5/fpm/php.ini

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

