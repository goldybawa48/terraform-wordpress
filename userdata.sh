#!/bin/bash
sudo apt update -y
sudo apt install mysql-server -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl start mysql
sudo systemctl enable mysql
sudo apt install php libapache2-mod-php php-mysql -y
sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
sudo systemctl restart apache mysql
cd /var/www/html/
sudo rm index.html
sudo wget -c http://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
cd /var/www/html/wordpress
sudo mv * /var/www/html
sudo mysql <<MYSQL_SCRIPT
CREATE DATABASE bawa;
CREATE USER goldy@localhost IDENTIFIED BY '12345678';
GRANT ALL PRIVILEGES ON bawa.* TO goldy@localhost;
FLUSH PRIVILEGES;
MYSQL_SCRIPT
sudo systemctl restart apache2
