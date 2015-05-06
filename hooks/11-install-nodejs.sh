#!/bin/bash
echo -e "\033[32;40;7m Instalacion Node.js\033[0m"
sleep 2
curl -sL https://deb.nodesource.com/setup | bash -
apt-get install -qq nodejs

npm install -g bower gulp grunt
