#!/bin/sh -eux

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
