#!/bin/bash

echo "\033[32;40;7m Instalacion Proyecto\033[0m"
sleep 2
echo "Creamos Carpeta donde estara alojado el Proyecto"
sleep 1
mkdir -p /var/www/$SITE
chown -R $USER:$USER /var/www/$SITE
chmod -R 755 /var/www
echo "\033[1;31;40m Clonando Repositorio\033[0m"
sleep 1
git clone git@gitlab.com:juegaenlinea/$GIT.git /var/www/$SITE
echo "\033[1;31;40m Instalacion Dependencias\033[0m"
sleep 1
cd /var/www/$SITE
composer install
bower install --allow-root --config.interactive=false
cd
