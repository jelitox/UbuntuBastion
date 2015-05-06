#!/bin/bash
echo "\033[32;40;7m Instalacion Nginx\033[0m"
add-apt-repository -y ppa:nginx/stable
apt-get update
apt-get install -qq nginx
sudo mkdir -p /var/www/$HOSTNAME
sed -i "s/user www-data;/user $USER;/" /etc/nginx/nginx.con
sed -i "s/# server_names_hash_bucket_size.*/server_names_hash_bucket_size 64;/" /etc/nginx/nginx.conf

usermod -a -G www-data $USER
sudo mkdir -p /var/www/$HOSTNAME
sudo chown -R $USER:$USER /var/www/$HOSTNAME
sudo chmod -R 755 /var/www

if [ ! -z $REPO ]; then
    git clone $REPO /var/www/$HOSTNAME
fi
