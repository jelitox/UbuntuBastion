#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "==== MUST BE RUN AS ROOT ===="
    exit 1
fi

USUARIO='vagrant'

HOSTNAME='bastion'
REPO='http://us-east-1.ec2.archive.ubuntu.com/ubuntu/' # http://us-east-1.ec2.archive.ubuntu.com/ubuntu/

if [ -f id_rsa ]; then
    if [ ! -d .ssh ]; then
        mkdir -p  ~/.ssh
    fi
    rm .ssh/id_rsa
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

# Configure HostName
. hooks.d/03-configure-hostname


####
# Languages
##########

# Install PHP
. hooks.d/10-install-php

# Install Node.js
. hooks.d/11-install-nodejs


####
# Web Servers
##########

# Install Node.js
. hooks.d/12-install-ngnix


####
# Database
##########

# Install Node.js
#. hooks.d/25-postgresql


####
# Analitics
##########

# Install NewRelic
. hooks.d/75-newrelic

# Install NewRelic
. hooks.d/76-loggy

# Install NewRelic
. hooks.d/99-project
