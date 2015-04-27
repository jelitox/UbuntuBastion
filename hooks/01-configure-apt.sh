#!/bin/bash
# 01-configure-apt
#
# Configuramos los Sources
#

rm /etc/apt/sources.list
rm /etc/apt/sources.list
touch /etc/apt/sources.list
echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
apt-get update
sudo mv sources.list /etc/apt/sources.list
apt-get update && apt-get -qq upgrade
