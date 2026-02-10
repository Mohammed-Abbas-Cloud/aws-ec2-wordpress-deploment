# AWS EC2 WordPress Deployment 

## Project Overview
This project demonstrates how to deploy a secure and scalable WordPress application on AWS EC2 using a LAMP stack (Linux, Apache, MySQL, PHP). It involves setting up the infrastructure, configuring security groups, and managing database permissions.

## Architecture 
* Cloud Provider: AWS (EC2 Free Tier).
* OS: Amazon Linux 2023.
* Web Server: Apache HTTP Server.
* Database: MariaDB (MySQL compatible).
* Scripting: PHP 8.x.

## Key Features
* ✅ Secure SSH connectivity strictly for admin IP.
* ✅ Custom Security Groups for HTTP/HTTPS traffic.
* ✅ Dedicated MySQL user/database for security (Not using Root).
* ✅ Proper file permission management for Apache.

## Installation Steps | خطوات العمل

### 1. Prerequisite
* AWS Account.
* Terminal / Git Bash.

### 2. Commands Used
All commands used to provision the server:

`bash
# --- 1. Update System ---
sudo dnf update -y

# --- 2. Install LAMP Stack ---
sudo dnf install httpd php php-mysqlnd mariadb105-server -y

# --- 3. Start Services ---
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl start mariadb
sudo systemctl enable mariadb

# --- 4. Secure Database ---
sudo mysql_secure_installation




3. Database Configuration (SQL)
   CREATE DATABASE wordpress_db;
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'YOUR_STRONG_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;


WordPress Installation

# Download and setup WordPress
cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzf latest.tar.gz
sudo cp -r wordpress/* .

# Fix Permissions (Critical Step)
sudo chown -R apache:apache /var/www/html

Screenshots
<img width="1920" height="1080" alt="dashboard" src="https://github.com/user-attachments/assets/bc47cd7b-9be4-4bda-a8d9-3b6981e067d9" />

<img width="1920" height="1080" alt="install" src="https://github.com/user-attachments/assets/220d0cb7-7b30-4b37-bcb0-2fc0030ff570" />


