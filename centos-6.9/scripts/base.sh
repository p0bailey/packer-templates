#!/bin/sh -eux
yum -y install gcc make gcc-c++ kernel-devel-`uname -r` perl epel-release net-tools htop vim git
yum -y upgrade
