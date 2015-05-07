#!/bin/bash
sleep 2
echo "\033[32;40;7m Instalacion Nginx\033[0m"
delay 2
add-apt-repository -y ppa:nginx/stable
apt-get update
apt-get install -qq nginx
sed -i "s/user www-data;/user $USER;/" /etc/nginx/nginx.con
sed -i "s/# server_names_hash_bucket_size.*/server_names_hash_bucket_size 64;/" /etc/nginx/nginx.conf

echo "\033[32;40;7m Descarga de Proyecto \033[0m"
sleep 2
usermod -a -G www-data $USER
rm -rf /var/www/html/
mkdir -p /var/www/$HOSTNAME
chown -R $USER:$USER /var/www/$HOSTNAME
chmod -R 755 /var/www
echo "\033[32;40;7m Clonando $PROJECT \033[0m"
delay 2
git clone git@gitlab.com:$GITUSER/$PROJECT.git /var/www/$HOSTNAME
