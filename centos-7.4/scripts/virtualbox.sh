#!/bin/sh -eux
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)

# required for VirtualBox 4.3.26
yum install -y bzip2


yum install -y dkms binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers
yum install -y kernel-devel

cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -f /home/vagrant/*.iso;
