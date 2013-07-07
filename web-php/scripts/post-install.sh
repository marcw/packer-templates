#!/bin/bash

if [ "$USER" != "root" ]; then
    echo '--- rerunning as root'
    sudo $0
else 
    # Vagrant specific stuff
    VAGRANT_PUBKEY="ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"
    adduser --disabled-password --gecos "Vagrant" vagrant
    mkdir /home/vagrant/.ssh
    echo $VAGRANT_PUBKEY >> /home/vagrant/.ssh/authorized_keys
    echo 'vagrant ALL = NOPASSWD: ALL' > /etc/sudoers.d/vagrant
    chown -R vagrant:vagrant /home/vagrant/.ssh

    # apt configuration
    sed -e '/cdrom/d' -i /etc/apt/sources.list
    cat <<EOC
deb http://packages.dotdeb.org wheezy all
deb http://packages.dotdeb.org wheezy-php55 all

deb http://ftp.ca.debian.org/debian stable main contrib non-free
deb http://ftp.debian.org/debian/ wheezy-updates main contrib non-free
deb http://security.debian.org/ wheezy/updates main contrib non-free
EOC > /etc/apt/sources.list
    curl -fsSL http://www.dotdeb.org/dotdeb.gpg | apt-key add -
    apt-get update
fi