#!/bin/bash
echo "\033[32;40;7m Instalacion Proyecto\033[0m"
sleep 2
echo "\033[1;31;40m Clonando Repositorio\033[0m"
sleep 1
git clone git@gitlab.com:$GITUSER/$PROJECT.git /var/www/$HOSTNAME
echo "\033[1;31;40m Instalacion Dependencias\033[0m"
sleep 1
cd /var/www/$HOSTNAME
composer install
bower install --allow-root --config.interactive=false
