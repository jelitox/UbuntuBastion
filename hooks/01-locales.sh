#!/bin/bash
# 00-locales
#
# Configuracion de locales
#
echo "\033[32;40;7m Instalacion Locales\033[0m"
apt-get install -qq locales dialog
locale-gen en_US.UTF-8
locale-gen en_US
locale-gen es_VE.UTF-8
locale-gen es_VE
dpkg-reconfigure locales
