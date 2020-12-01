#!/bin/sh -eux
#Base
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y upgrade
apt-get -y install linux-headers-$(uname -r) build-essential dkms

sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers

echo "UseDNS no" >> /etc/ssh/sshd_config

rm -f /etc/udev/rules.d/70-persistent-net.rules;
mkdir -p /etc/udev/rules.d/70-persistent-net.rules;
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules;
## Vagrant
date > /etc/vagrant_box_build_time

mkdir /home/vagrant/.ssh
wget --no-check-certificate \
    'https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub' \
    -O /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
## Virtualbox
VER="`cat /home/vagrant/.vbox_version`";

echo "Virtualbox Tools Version: $VER";

mkdir -p /tmp/vbox;
mount -o loop /home/vagrant/VBoxGuestAdditions_${VER}.iso /tmp/vbox;
sh /tmp/vbox/VBoxLinuxAdditions.run \
        || echo "VBoxLinuxAdditions.run exited $? and is suppressed." \
            "For more read https://www.virtualbox.org/ticket/12479";
umount /tmp/vbox;
rm -rf /tmp/vbox;
rm -f /home/vagrant/*.iso;
### Provision
apt-get update
apt-get dist-upgrade -y
apt-get -y install vim python-pip python3-venv python3-pip unzip git
pip3 install ansible molecule
## Cleanup
echo "Delete unneeded files."
rm -f /home/vagrant/*.sh

echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*

echo "Apt cleanup."
sudo apt-get -y autoremove
sudo apt-get -y clean

sync
## Zerodisc
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
