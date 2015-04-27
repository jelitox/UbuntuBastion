#!/bin/sh

HOSTNAME='staging'


if [ "$(id -u)" != "0" ]; then
    echo "==== MUST BE RUN AS ROOT ===="
    exit 1
fi

sudo apt-get update
sudo apt-get install -qq curl unzip git-core ack-grep software-properties-common build-essential

git clone https://github.com/aasanchez/WebPro.git Provision

for f in $(find Provision/hooks/* -maxdepth 1 -executable -type f ! -iname "*.md" ! -iname ".*" | sort --numeric-sort); do
    . $f
done
