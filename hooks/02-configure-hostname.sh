#!/bin/bash
# 01-configure-apt
#
# Configuracion de HostName
#

hostnamectl --set-hostname $HOSTNAME
sed -i -e '/ *#/d; /^ *$/d' /etc/hosts
echo " " >> /etc/hosts
echo "# Host IP Address" >> /etc/hosts
echo "127.0.0.1 $HOSTNAME" >> /etc/hosts
