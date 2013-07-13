#!/bin/bash
cat > /etc/apt/sources.list <<EOC
deb http://packages.dotdeb.org wheezy all
deb http://packages.dotdeb.org wheezy-php55 all

deb http://ftp.ca.debian.org/debian stable main contrib non-free
deb http://ftp.debian.org/debian/ wheezy-updates main contrib non-free
deb http://security.debian.org/ wheezy/updates main contrib non-free
EOC

wget http://www.dotdeb.org/dotdeb.gpg -O - | apt-key add -
apt-get update