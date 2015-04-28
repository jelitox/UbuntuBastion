#!/bin/bash
# 01-configure-apt
#
# Configuracion de HostName
#
echo "Setting Timezone & Locale to UTC & C.UTF-8"

ln -sf /usr/share/zoneinfo/UTC /etc/localtime
locale-gen C.UTF-8
export LANG=C.UTF-8

if [ $USER == "root" ]; then
    echo "export LANG=C.UTF-8" >> /root/.bashrc
else
    echo "export LANG=C.UTF-8" >> /home/$USER/.bashrc
fi

apt-get update
apt-get install -qq curl unzip git-core ack-grep software-properties-common build-essential nano
