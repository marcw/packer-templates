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

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer