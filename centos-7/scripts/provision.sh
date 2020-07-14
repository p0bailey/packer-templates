#!/bin/sh -eux

yum -y upgrade

yum install -y python-pip python-devel build-essential libffi-dev libssl-dev git openssl-devel  libffi-devel
pip install --upgrade pip
pip install --upgrade setuptools
pip install ansible

yum -y upgrade

yum remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine

yum install -y yum-utils vim

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo


yum install -y docker-ce docker-ce-cli containerd.io

systemctl enable docker

usermod -aG docker vagrant

curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /bin/docker-compose

chmod +x /bin/docker-compose
