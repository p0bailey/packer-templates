#!/bin/sh
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get dist-upgrade -y
apt-get -y install vim python3-venv python3-pip unzip git
pip3 install ansible molecule pytest-testinfra
