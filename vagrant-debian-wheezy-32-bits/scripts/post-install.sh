#!/bin/bash

if [ "$USER" != "root" ]; then
    echo '--- rerunning as root'
    sudo $0
else 
    VAGRANT_PUBKEY="ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"

    adduser --disabled-password --gecos "Vagrant" vagrant
    mkdir /home/vagrant/.ssh
    echo $VAGRANT_PUBKEY >> /home/vagrant/.ssh/authorized_keys
    echo 'vagrant ALL = NOPASSWD: ALL' > /etc/sudoers.d/vagrant
    chown -R vagrant:vagrant /home/vagrant/.ssh
    sed -e '/cdrom/d' -i /etc/apt/sources.list
fi