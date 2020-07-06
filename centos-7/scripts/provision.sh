#!/bin/sh -eux

yum -y upgrade

yum install -y python-pip python-devel build-essential libffi-dev libssl-dev git openssl-devel  libffi-devel
pip install --upgrade pip
pip install --upgrade setuptools
pip install ansible

yum -y upgrade
