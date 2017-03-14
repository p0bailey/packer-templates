#!/bin/sh -eux
sudo yum -y install epel-release
sudo yum install -y python-pip python-devel build-essential libffi-dev libssl-dev git openssl-devel  libffi-devel
sudo pip install --upgrade pip
sudo pip install --upgrade setuptools
sudo pip install ansible


sudo yum -y upgrade
