#!/bin/bash
curl -sL https://deb.nodesource.com/setup | sudo bash -
apt-get install -qq nodejs

packages=(bower gulp grunt)
for item in ${packages[*]}
do
    echo "install $item"
    npm install -g $item
done
