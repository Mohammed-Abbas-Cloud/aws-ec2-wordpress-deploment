#!/bin/bash
# WordPress Installation Script for Amazon Linux 2023
# Created by: [Your Name]

echo "--- Updating System ---"
sudo dnf update -y

echo "--- Installing LAMP Stack ---"
sudo dnf install httpd php php-mysqlnd mariadb105-server -y

echo "--- Starting Services ---"
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl start mariadb
sudo systemctl enable mariadb

echo "--- Downloading WordPress ---"
cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzf latest.tar.gz
sudo cp -r wordpress/* .
sudo rm -rf wordpress latest.tar.gz

echo "--- Setting Permissions ---"
sudo chown -R apache:apache /var/www/html

echo "--- DONE! Please configure Database manually ---"
