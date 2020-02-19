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
     graphicsmagick \
     htop

INSTALL_PKGS="tig direnv jq vim zsh neovim"
for i in $INSTALL_PKGS; do
  sudo apt-get install -y $i
done

INSTALL_NODE_PKGS="cli-github dockly fx terminalizer"
for i in $INSTALL_NODE_PKGS; do
  npm i -g npm-install-peers $i
done

# Keybase
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
apt install ./keybase_amd64.deb -y

#LazyDocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

#Kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl


pip3 install ansible molecule asciinema
pip install awscli glances saws


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

TERRAFORM_VERSION="0.12.21"
cd /tmp && \
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

VAULT_VERSION="1.3.2"
cd /tmp && \
wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
unzip -o vault_${VAULT_VERSION}_linux_amd64.zip -d /usr/bin

AWSVULT_VERSION="v5.3.2"
wget -N https://github.com/99designs/aws-vault/releases/download/${AWSVULT_VERSION}/aws-vault-linux-amd64 -O /usr/bin/aws-vault && \
chmod +x /usr/bin/aws-vault


GO_VERSION="1.13.7"
cd /tmp && \
wget -N https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && \
tar xvfz go${GO_VERSION}.linux-amd64.tar.gz && \
cp -a go/bin/go* /usr/bin/
