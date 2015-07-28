#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "==== MUST BE RUN AS ROOT ===="
    exit 1
fi

USUARIO='vagrant'

HOSTNAME='bastion'
REPO='http://us-east-1.ec2.archive.ubuntu.com/ubuntu/' # http://us-east-1.ec2.archive.ubuntu.com/ubuntu/

NR_LICENCE= #New Relic Licence

if [ -f id_rsa ]; then
    if [ ! -d .ssh ]; then
        mkdir .ssh
    fi
    rm .ssh/id_rsa
    cp id_rsa ~/.ssh/id_rsa
    chmod 400 ~/.ssh/id_rsa
else
    if [ -f deploy_key ]; then
        rm deploy_key*
    fi
    ssh-keygen -t rsa -b 4096 -N "" -C "servers@$HOSTNAME" -f deploy_key
    echo "Copie el siguiente public key en un sitio seguro"
    echo "Agrege como deploy key para el proyecto que desea instalar"
    echo ""
    echo ""
    cat deploy_key.pub
    echo ""
    echo ""
    #read -p "Presione Enter para continuar... " -n1 -s
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
# Analitics
##########

# Install NewRelic
#. hooks.d/13-newrelic

# Install NewRelic
#. hooks.d/14-loggy

# Install NewRelic
. hooks.d/99-project
