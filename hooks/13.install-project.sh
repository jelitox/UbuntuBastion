#!/bin/bash
echo "\033[32;40;7m Instalacion Proyecto\033[0m"
delay 2
echo "\033[32;40;7m Clonando Repositorio\033[0m"
delay 1
git clone git@gitlab.com:$GITUSER/$PROJECT.git /var/www/$HOSTNAME
echo "\033[32;40;7m Instalacion Dependencias\033[0m"
delay 1
cd /var/www/$HOSTNAME
composer install
bower install
