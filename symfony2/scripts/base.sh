#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

mv /tmp/sources.list /etc/apt/sources.list
wget http://www.dotdeb.org/dotdeb.gpg -O - | apt-key add -

apt-get update

# nginx
apt-get -qy install nginx
cp /tmp/nginx.conf /etc/nginx/sites-available/default

# php
apt-get -qy install \
    php5-fpm \
    php5-cli \
    php5-intl \
    php5-xhprof \

cp /tmp/php.ini /etc/php5/cli/php.ini
cp /tmp/php.ini /etc/php5/fpm/php.ini

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# postgresql
if [ $install_postgresql = "true" ]
then
    apt-get -qy install postgresql postgresql-client php5-pgsql
fi

# mysql
if [ $install_mysql = "true" ]
then
    apt-get -qy install mysql-client mysql-server php5-mysqlnd
fi

# redis
if [ $install_redis = "true" ]
then
    apt-get -qy install php5-redis redis-server
fi

# mongodb
if [ $install_mongodb = "true" ]
then
    apt-get -qy install mongodb-server
fi

# rabbitmq
if [ $install_rabbitmq = "true" ]
then
    wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc -O - | apt-key add -
    apt-get update
    apt-get -qy install rabbitmq-server

    /usr/lib/rabbitmq/bin/rabbitmq-plugins enable rabbitmq_management
    /etc/init.d/rabbitmq-server restart
    curl http://localhost:15672/cli/rabbitmqadmin > /usr/local/bin/rabbitmqadmin
    chmod +x /usr/local/bin/rabbitmqadmin
fi

# daemontools
if [ $install_daemontools = "true" ]
then
    apt-get -qy install daemontools-run
fi

# monit
if [ $install_monit = "true" ]
then
    apt-get -qy install monit
fi

# httpie
if [ $install_httpie = "true" ]
then
    apt-get -qy install httpie
fi
