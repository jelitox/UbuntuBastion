#!/bin/bash
# 00-locales
#
# Configuracion de locales
#
apt-get install -qq locales dialog
locale-gen en_US.UTF-8
locale-gen en_US
dpkg-reconfigure locales