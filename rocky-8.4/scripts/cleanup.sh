#!/bin/sh -eux
yum -y erase gtk2 libX11 hicolor-icon-theme avahi freetype bitstream-vera-fonts
yum -y clean all
rm -rf /tmp/rubygems-*
