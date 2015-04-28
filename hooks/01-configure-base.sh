#!/bin/bash
# 01-configure-apt
#
# Configuracion de HostName
#
echo "Setting Timezone & Locale to UTC & C.UTF-8"

sudo ln -sf /usr/share/zoneinfo/UTC /etc/localtime
sudo locale-gen C.UTF-8
export LANG=C.UTF-8

echo "export LANG=C.UTF-8" >> /home/$USER/.bashrc
apt-get update
apt-get install -qq curl unzip git-core ack-grep software-properties-common build-essential
