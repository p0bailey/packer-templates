#!/bin/sh -eux

yum -y upgrade
dnf -y update

yum -y install epel-release
yum install -y  gcc kernel-devel kernel-headers dkms make bzip2 perl python3 python3-pip


yum update -y kernel-*
