# AWS EC2 WordPress Deployment 

## Project Overview
This project demonstrates how to deploy a secure and scalable WordPress application on AWS EC2 using a LAMP stack (Linux, Apache, MySQL, PHP). It involves setting up the infrastructure, configuring security groups, and managing database permissions.

## Architecture
* Cloud Provider: AWS (EC2 Free Tier).
* OS: Amazon Linux 2023.
* Web Server: Apache HTTP Server.
* Database: MariaDB (MySQL compatible).
* Scripting: PHP 8.2.

## Key Features 
* ✅ Secure SSH connectivity strictly for admin IP.
* ✅ Custom Security Groups for HTTP/HTTPS traffic.
* ✅ Dedicated MySQL user/database for security (Not using Root).
* ✅ Proper file permission management for Apache.

## Installation Steps 

### 1. Prerequisite
* AWS Account.
* Terminal / Git Bash.

### 2. Commands Used
`bash
# Update System
sudo dnf update -y

# Install LAMP Stack
sudo dnf install httpd php php-mysqlnd mariadb105-server -y

# Start Services
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Secure Database
sudo mysql_secure_installation

# Configure Database (SQL)
# CREATE DATABASE wordpress_db;
# CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'PASSWORD';
# GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_user'@'localhost';

# Download WordPress
wget [https://wordpress.org/latest.tar.gz](https://wordpress.org/latest.tar.gz)
tar -xzf latest.tar.gz
sudo cp -r wordpress/* /var/www/html/

# Fix Permissions
sudo chown -R apache:apache /var/www/html
