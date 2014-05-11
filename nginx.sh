#!/usr/bin/env bash

echo "--- Installation av LEMP (Linux, Nginx, MySQL, PHP) ---"

echo "--- Uppdatera packages ---"
sudo apt-get update

echo "--- MySQL ---"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

echo "--- Vi vill ha senaste PHP versionen ---"
sudo add-apt-repository -y ppa:ondrej/php5

echo "--- Uppdatera packages ---"
sudo apt-get update

echo "--- Installera MySQL ---"
apt-get install -y mysql-server-5.5 php5-mysql

echo "--- Installera Nginx ---"
sudo apt-get install nginx

echo "--- Starta Nginx ---"
sudo service nginx start

echo "--- Installera PHP ---"
sudo apt-get install -y php5-fpm php5-curl php5-gd php5-mcrypt git-core

echo "--- mod-rewrite ---"
sudo a2enmod rewrite

echo "--- Starta om Apache ---"
sudo service apache2 restart