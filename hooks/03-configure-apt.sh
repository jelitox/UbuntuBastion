#!/bin/bash
# 01-configure-apt
#
# Configuramos los Sources
#
echo "\033[32;40;7m Configruacion de los nuevos respositorios\033[0m"
sleep 2
rm /etc/apt/sources.list
touch /etc/apt/sources.list
echo "deb $REPO trusty main universe multiverse" >> /etc/apt/sources.list
echo "deb $REPO trusty-updates main universe multiverse" >> /etc/apt/sources.list
echo "deb $REPO trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://security.ubuntu.com/ubuntu trusty-security main universe multiverse" >> /etc/apt/sources.list
echo "deb http://archive.canonical.com/ubuntu trusty partner" >> /etc/apt/sources.list
apt-get update
apt-get update && apt-get -qq upgrade
apt-get -qq dist-upgrade
