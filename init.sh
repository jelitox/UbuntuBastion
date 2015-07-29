#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "==== MUST BE RUN AS ROOT ===="
    exit 1
fi

USUARIO='vagrant'

HOSTNAME='bastion'
REPO='http://us-east-1.ec2.archive.ubuntu.com/ubuntu/' # http://us-east-1.ec2.archive.ubuntu.com/ubuntu/

if [ -f id_rsa ]; then
    if [ ! -d ~/.ssh ]; then
        mkdir ~/.ssh
    fi
    rm ~/.ssh/id_rsa
    cp id_rsa ~/.ssh/id_rsa
    chmod 400 ~/.ssh/id_rsa
fi

####
# OS Configurations
##########

# Configuracion de Repositorios
. hooks.d/01-configure-apt

# Paquetes Basicos
. hooks.d/02-configure-base

# Set Hostname
. hooks.d/03-configure-hostname


####
# Languages
##########

# Install PHP
. hooks.d/25-install-php

# Install Node.js
. hooks.d/26-install-nodejs


####
# Web Servers
##########

# Install Ngnix
. hooks.d/27-install-ngnix


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

# Install NewRelic
. hooks.d/81-loggy
