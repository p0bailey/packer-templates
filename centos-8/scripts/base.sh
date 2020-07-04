#!/bin/sh -eux

yum -y upgrade
dnf -y update

yum -y install epel-release
dnf install -y  gcc kernel-devel kernel-headers dkms make bzip2 perl
