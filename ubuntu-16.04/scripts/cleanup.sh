# #!/bin/sh
export DEBIAN_FRONTEND=noninteractive

echo "Delete unneeded files."
rm -f /home/vagrant/*.sh

echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*

rm /home/vagrant/*.iso

echo "Apt cleanup."
apt-get -y autoremove
apt-get -y clean

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
