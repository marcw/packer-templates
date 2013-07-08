#!/bin/bash
VAGRANT_PUBKEY="ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"

echo "[vagrant] create .ssh directory"
mkdir -pm 700 /home/vagrant/.ssh

echo "[vagrant] create authorized_keys"
echo $VAGRANT_PUBKEY > /home/vagrant/.ssh/authorized_keys

echo "[vagrant] set permissions"
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/

# miscellaneous
echo "[vagrant] misc stuff"
date > /etc/vagrant_box_build_time
echo 'Welcome to your Vagrant-built virtual machine.' > /var/run/motd