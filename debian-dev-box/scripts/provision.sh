#!/bin/sh
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get dist-upgrade -y

export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

sed -i '1 i\export PATH="/sbin:$PATH"' /home/vagrant/.bashrc

apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common \
     vim \
     python-pip \
     python3-venv \
     python3-pip \
     unzip \
     zsh \
     tig \
     direnv \
     jq

pip3 install ansible molecule
pip install awscli

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

echo "Install Docker"
apt update
apt install -y  docker-ce

groupadd docker
usermod -aG docker vagrant

TERRAFORM_VERSION="0.12.20"
cd /tmp && \
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

AWSVULT_VERSION="v5.2.0"
wget -N https://github.com/99designs/aws-vault/releases/download/${AWSVULT_VERSION}/aws-vault-linux-amd64 -O /usr/bin/aws-vault && \
chmod +x /usr/bin/aws-vault

GO_VERSION="1.13.7"
cd /tmp && \
wget -N https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && \
tar xvfz go${GO_VERSION}.linux-amd64.tar.gz && \
cp -a go/bin/go* /usr/bin/
