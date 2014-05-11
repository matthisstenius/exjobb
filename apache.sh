#!/usr/bin/env bash

echo "--- Installation av LAMP ---"

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
apt-get install -y mysql-server-5.5 libapache2-mod-auth-mysql php5-mysql

echo "-- Installera Apache ---"
sudo apt-get install apache2

echo "--- PHP specifika paket ---"
sudo apt-get install -y php5 php5-curl php5-gd php5-mcrypt git-core

echo "--- mod-rewrite ---"
sudo a2enmod rewrite

echo "--- Starta om Apache ---"
sudo service apache2 restart