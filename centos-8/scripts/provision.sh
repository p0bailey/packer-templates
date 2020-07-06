#!/bin/sh -eux

yum -y upgrade

dnf -y upgrade 

pip3 install --upgrade pip

dnf -y install ansible
