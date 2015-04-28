#!/bin/bash
#Instalamos PHP
GROUP=$(id -Gn)
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C
add-apt-repository -y ppa:ondrej/php5-5.6
apt-key update
apt-get update
apt-get install -qq php5-cli php5-fpm php5-mysql php5-pgsql php5-sqlite php5-curl php5-gd php5-gmp php5-mcrypt php5-memcached php5-imagick php5-intl
sed -i "s/listen =.*/listen = 127.0.0.1:9000/" /etc/php5/fpm/pool.d/www.conf
sed -i "s/;listen.allowed_clients/listen.allowed_clients/" /etc/php5/fpm/pool.d/www.conf
sed -i "s/user = www-data/user = $USER/" /etc/php5/fpm/pool.d/www.conf
sed -i "s/group = www-data/group = $GROUP/" /etc/php5/fpm/pool.d/www.conf
sed -i "s/listen\.owner.*/listen.owner = $USER/" /etc/php5/fpm/pool.d/www.conf
sed -i "s/listen\.group.*/listen.group = $GROUP/" /etc/php5/fpm/pool.d/www.conf
sed -i "s/listen\.mode.*/listen.mode = 0666/" /etc/php5/fpm/pool.d/www.conf
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/fpm/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/fpm/php.ini
sed -i "s/;date.timezone =.*/date.timezone = \"UTC\"/" /etc/php5/fpm/php.ini
sed -i "s/;date.timezone =.*/date.timezone = \"UTC\"/" /etc/php5/cli/php.ini
service php5-fpm restart

#Instalamos Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
