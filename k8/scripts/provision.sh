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

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" \
        | tee -a /etc/apt/sources.list.d/kubernetes.list


echo "Install Kubernetes-Docker"
apt update
apt install -y  docker-ce kubeadm  kubelet kubernetes-cni


# kubelet requires swap off
swapoff -a
# keep swap off after reboot
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

echo "Disable nftables"
update-alternatives --set iptables /usr/sbin/iptables-legacy
