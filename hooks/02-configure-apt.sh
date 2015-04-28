#!/bin/bash
# 01-configure-apt
#
# Configuramos los Sources
#

rm /etc/apt/sources.list
touch /etc/apt/sources.list
echo "deb $REPO trusty main universe multiverse" >> /etc/apt/sources.list
echo "deb $REPO trusty-updates main universe multiverse" >> /etc/apt/sources.list
echo "deb $REPO trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://security.ubuntu.com/ubuntu trusty-security main universe multiverse" >> /etc/apt/sources.list
echo "deb http://archive.canonical.com/ubuntu trusty partner" >> /etc/apt/sources.list
apt-get update
apt-get update && apt-get -qq upgrade