#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "==== MUST BE RUN AS ROOT ===="
    exit 1
fi
# Server Configuration
REPO='http://us-east-1.ec2.archive.ubuntu.com/ubuntu/' # http://us-east-1.ec2.archive.ubuntu.com/ubuntu/

HOSTNAME='bastion.dev'

NR_LICENCE=5688bd0a93236d73c99eb3275a019f174fc61b5c

PGSQL_USER="vagrant"
PGSQL_PASS="vagrant"
PGSQL_DDBB="vagrant"

LOGGLY_ACCOUNT="juegaenlinea"
LOGGLY_USER="aasanchez"
LOGGLY_KEY="5d2c64ec-02b2-46ba-b8f1-0acb0d5e65dc"

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
. hooks.d/01-apt

# Paquetes Basicos
. hooks.d/02-OS-base

# Set Hostname
. hooks.d/03-hostname


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
. hooks.d/55-postgresql


####
# Analitics
##########

# Install NewRelic
. hooks.d/80-newrelic

# Install NewRelic
. hooks.d/81-loggly
