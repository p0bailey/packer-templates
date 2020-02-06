#!/bin/sh
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get dist-upgrade -y
apt-get -y install vim python-pip python3-venv python3-pip unzip
pip3 install ansible molecule

#TERRAFORM_VERSION="0.12.20"

#cd /tmp && \
#wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
#unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin
