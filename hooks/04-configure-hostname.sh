#!/bin/bash
# 01-configure-apt
#
# Configuracion de HostName
#
echo "\033[32;40;7m Cambiar HostName\033[0m"
hostnamectl set-hostname $HOSTNAME
sed -i -e '/ *#/d; /^ *$/d' /etc/hosts
echo " " >> /etc/hosts
echo "# Host IP Address" >> /etc/hosts
echo "127.0.0.1 $HOSTNAME" >> /etc/hosts
