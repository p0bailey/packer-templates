#!/bin/sh -eux
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y dist-upgrade
apt install -y apt-transport-https ca-certificates software-properties-common curl


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt update
apt install -y  docker-ce kubeadm  kubelet kubernetes-cni



# kubelet requires swap off
sudo swapoff -a
# keep swap off after reboot
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
