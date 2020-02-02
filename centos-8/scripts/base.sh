#!/bin/sh -eux

dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

yum -y upgrade

yum -y install gcc \
binutils make gcc-c++ \
patch libgomp dkms perl \
epel-release net-tools \
glibc-headers glibc-devel \
kernel-headers bzip2 \
kernel-devel kernel-devel-`uname -r`
