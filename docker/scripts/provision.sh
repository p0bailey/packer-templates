#!/bin/sh -eux
export DEBIAN_FRONTEND=noninteractive


export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

sed -i '1 i\export PATH="/sbin:$PATH"' /home/vagrant/.bashrc

apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common \
     vim

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
