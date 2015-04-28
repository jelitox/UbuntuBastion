#!/bin/bash
echo -e "\033[32;40;7m Instalacion Nginx\033[0m"
add-apt-repository -y ppa:nginx/stable
apt-get update
apt-get install -qq nginx
