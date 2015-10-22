#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "==== MUST BE RUN AS ROOT ===="
    exit 1
fi
# Server Configuration
REPO='' # http://us-east-1.ec2.archive.ubuntu.com/ubuntu/

HOST='bastion.dev'

NR_LICENCE=''

DB_NAME=''
DB_USER=''
DB_PASS=''


SSH_PORT='2021'

USERNAME='vagrant'
GROUP='vagrant'

COMPOSER_PAT=''

if [ -f id_rsa ]; then

    if [ ! -d ~/.ssh ]; then
        mkdir ~/.ssh
    fi

    if [ -f ~/.ssh/id_rsa ]; then
        rm ~/.ssh/id_rsa
    fi

    cp id_rsa ~/.ssh/id_rsa
    chmod 400 ~/.ssh/id_rsa

fi

####
# OS Configurations
##########
# Configuracion de Repositorios
. hooks.d/01-apt
# Paquetes Basicos
. hooks.d/02-OS-base
# Set Hostname
. hooks.d/03-hostname
# Set ssh
. hooks.d/04-ssh

####
# Languages
##########
# Install PHP
. hooks.d/25-php
# Install Node.js
. hooks.d/26-nodejs

####
# Web Servers
##########
# Install Ngnix
. hooks.d/27-nginx

####
# Database
##########
# Install PostGresql
#. hooks.d/55-postgresql

####
# Analitics
##########
# Install NewRelic
. hooks.d/80-newrelic

####
# Auditorias
##########
# Bastionado
. hooks.d/90-harden
# Install Lynis
. hooks.d/98-lynis
# Cierre
echo -e "\033[32;40;7m Limpieza general \033[0m"
sleep 2
aptitude update
aptitude -y upgrade
aptitude -y dist-upgrade
aptitude -y full-upgrade
aptitude -y safe-upgrade
aptitude -y autoclean
aptitude -y clean
apt-get -qq update
apt-get -qq upgrade
apt-get -qq dist-upgrade
apt-get -qq clean
apt-get -qq autoclean
apt-get -qq autoremove
echo -e "\033[32;40;7m Resultados \033[0m"
echo -e "\033[31;47;7m Copiar esto a ~./ssh/config \033[0m"
IP=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')

echo "Host $HOST"
echo "    Hostname $IP"
echo "    Port $SSH_PORT"
echo "    User $USERNAME"
