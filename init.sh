#!/bin/sh

SITE='juegaenlinea'
GIT=$1

#Respositorios
REPO='http://us-east-1.ec2.archive.ubuntu.com/ubuntu/' # http://us-east-1.ec2.archive.ubuntu.com/ubuntu/


if [ "$(id -u)" != "0" ]; then
    echo "==== MUST BE RUN AS ROOT ===="
    exit 1
fi

apt-get update
apt-get install -qq curl unzip git-core ack-grep software-properties-common build-essential dbus

git clone https://github.com/aasanchez/UbuntuBastion.git Provision

for f in $(find Provision/hooks/* -maxdepth 1 | sort --numeric-sort); do
    cd #Garantizamos que el puntero vuelva a home
    . $f
done
