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
# Base Items
##########

# Configuracion de Repositorios
. hooks.d/01-configure-apt

# Paquetes Basicos
. hooks.d/02-configure-base

# Set Hostname
. hooks.d/03-configure-hostname


####
# Lenguajes de Programación
##########

# PHP
. hooks.d/25-install-php

# Node.js
. hooks.d/26-install-nodejs


####
# Servidor Web
##########

# Nginx
. hooks.d/27-install-nginx


####
# Herramientas de Monitoreo y Analisis
##########

# New relic
. hooks.d/80-newrelic

# Loggly
. hooks.d/81-loggly
