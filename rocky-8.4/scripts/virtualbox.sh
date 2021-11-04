#!/bin/sh -eux
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)


cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -f /home/vagrant/*.iso;
