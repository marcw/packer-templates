#!/bin/bash
mv /tmp/sources.list /etc/apt/sources.list
wget http://www.dotdeb.org/dotdeb.gpg -O - | apt-key add -
apt-get update