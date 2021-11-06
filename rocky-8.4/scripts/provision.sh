#!/bin/sh -eux

python3 -m pip install --upgrade --force-reinstall pip

python3 -m pip install ansible molecule pytest-testinfra --ignore-installed PyYAML

yum config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

yum -y upgrade

yum install -y git unzip vim

yum install docker-ce --nobest -y

systemctl start docker

systemctl enable docker

usermod -aG docker vagrant

curl -L "https://github.com/docker/compose/releases/download/v2.1.0/docker-compose-$(uname -s)-$(uname -m)" -o /bin/docker-compose

chmod +x /bin/docker-compose
