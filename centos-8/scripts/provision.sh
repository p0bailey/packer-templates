#!/bin/sh -eux

yum -y upgrade

dnf -y upgrade 

pip3 install --upgrade pip

dnf -y install ansible

dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

dnf install docker-ce --nobest -y

systemctl start docker

systemctl enable docker

usermod -aG docker vagrant

curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /bin/docker-compose

chmod +x /bin/docker-compose
