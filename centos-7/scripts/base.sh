#!/bin/sh -eux
yum -y upgrade

yum -y install gcc \
binutils make gcc-c++ \
patch libgomp dkms perl \
epel-release net-tools \
glibc-headers glibc-devel \
kernel-headers bzip2 \
kernel-devel kernel-devel-`uname -r`
