#!/bin/sh
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get dist-upgrade -y

export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

sed -i '1 i\export PATH="/sbin:$PATH"' /home/vagrant/.bashrc

curl -L https://npmjs.org/install.sh | sudo sh

apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common \
     python-pip \
     python3-venv \
     python3-pip \
     unzip \
     nodejs \
     npm \
     graphicsmagick \
     htop

PIP_INSTALL_PKGS="ansible molecule asciinema awscli glances saws"
for i in $PIP_INSTALL_PKGS; do
 sudo pip3 install $i
done

INSTALL_PKGS="tig direnv jq vim zsh neovim"
for i in $INSTALL_PKGS; do
  sudo apt-get install -y $i
done

INSTALL_NODE_PKGS="cli-github dockly fx terminalizer"
for i in $INSTALL_NODE_PKGS; do
  sudo npm i -g npm-install-peers --unsafe $i
done

GO_VERSION="1.15.6"
AWSVULT_VERSION="v5.3.2"
VAULT_VERSION="1.6.0"
TERRAFORM_VERSION="0.14.0"

#LazyDocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

#Kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

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

cd /tmp && \
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

cd /tmp && \
wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
unzip -o vault_${VAULT_VERSION}_linux_amd64.zip -d /usr/bin

wget -N https://github.com/99designs/aws-vault/releases/download/${AWSVULT_VERSION}/aws-vault-linux-amd64 -O /usr/bin/aws-vault && \
chmod +x /usr/bin/aws-vault

cd /tmp && \
wget -N https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && \
tar xvfz go${GO_VERSION}.linux-amd64.tar.gz && \
cp -a go/bin/go* /usr/bin/
