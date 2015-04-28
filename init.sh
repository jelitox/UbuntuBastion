#!/bin/sh

HOSTNAME='staging'

#Respositorios
REPO='mirror://mirrors.ubuntu.com/mirrors.txt' # http://us-east-1.ec2.archive.ubuntu.com/ubuntu/





if [ "$(id -u)" != "0" ]; then
    echo "==== MUST BE RUN AS ROOT ===="
    exit 1
fi

apt-get update
apt-get install -qq curl unzip git-core ack-grep software-properties-common build-essential dbus

git clone https://github.com/aasanchez/WebPro.git Provision

if [ -e Provision/hooks/01-configure-apt.sh ]; then
    for f in $(find Provision/hooks/* -maxdepth 1 -executable -type f ! -iname "*.md" ! -iname ".*" | sort --numeric-sort); do
        . $f
    done
else
    for f in $(find hooks/* -maxdepth 1 -executable -type f ! -iname "*.md" ! -iname ".*" | sort --numeric-sort); do
        . $f
    done
fi
