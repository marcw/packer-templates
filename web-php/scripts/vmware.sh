#!/bin/bash
apt-get -q -y install gcc make fuse fuse-utils linux-headers-$(uname -r)

mkdir /mnt/vmware
mount -o loop /tmp/linux.iso /mnt/vmware
cd /tmp
tar xzf /mnt/vmware/VMwareTools-*.tar.gz
/tmp/vmware-tools-distrib/vmware-install.pl -d

umount /mnt/vmware
rm -rf /tmp/vmware-tools-distrib/
rm -f /tmp/linux.iso