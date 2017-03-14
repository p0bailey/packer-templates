#!/bin/sh -eux
yum -y erase gtk2 libX11 hicolor-icon-theme avahi freetype bitstream-vera-fonts
yum -y clean all
rm -rf /tmp/rubygems-*

# for ifcfg in $(ls /etc/sysconfig/network-scripts/ifcfg-*)
# do
#     if [ "$(basename ${ifcfg})" != "ifcfg-lo" ]
#     then
#         sed -i '/^UUID/d'   /etc/sysconfig/network-scripts/ifcfg-enp0s3
#         sed -i '/^HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-enp0s3
#     fi
# done
