#!/bin/bash 

sudo apt-get update
sudo apt-get install apache2 -y
sudo apt-get install php-curl -y
sudo apt-get install php-mysql -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update 
sudo apt install php7.1-curl -y
sudo apt-get install php7.2-mbstring -y
sudo apt-get install php-xml -y 
sudo apt-get install php-gd -y
sudo apt-get install libapache2-mod-php -y
sudo apt-get install mysql-client -y
