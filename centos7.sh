#!/bin/bash

#####################################################
# Script to confiruge Server on CentOS 7 						#
#####################################################

#Colors settings
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color
#Welcome message

clear
echo -e "Welcome to CentOS 7 stack installation and configuration wizard!"

#YUM
echo -e "${YELLOW}Installing yum${NC}"
yum update -y;

#NANO
echo -e "${YELLOW}Installing nano${NC}"
yum install nano -y;

#ZIP
echo -e "${YELLOW}Installing zip${NC}"
yum install zip -y;

#UNZIP
echo -e "${YELLOW}Installing unzip${NC}"
yum install unzip -y;

#MC
echo -e "${YELLOW}Installing mc${NC}"
yum install mc -y;

#HTOP
echo -e "${YELLOW}Installing htop${NC}"
wget dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-12.noarch.rpm;
rpm -ihv epel-release-7-12.noarch.rpm;
yum install htop -y;

#WGET
echo -e "${YELLOW}Installing wget${NC}"
yum install wget -y;

#CURL
echo -e "${YELLOW}Installing curl${NC}"
yum install curl -y;

#GIT
echo -e "${YELLOW}Installing git${NC}"
yum install git -y;

#NET-TOOLS
echo -e "${YELLOW}Installing net-tools${NC}"
yum install net-tools -y;

#NODEJS
echo -e "${YELLOW}Installing nodejs${NC}"
curl -sL https://rpm.nodesource.com/setup_10.x | bash -;
yum install nodejs -y;

#PM2
echo -e "${YELLOW}Installing pm2${NC}"
npm i -g pm2

#MYSQL
echo -e "${YELLOW}Installing mysql${NC}"
echo "[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.5/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1" >> /etc/yum.repos.d/MariaDB.repo
yum clean all;
yum install MariaDB-server -y;
systemctl start mariadb;
systemctl enable mariadb;
mysql_secure_installation;
systemctl stop mariadb;

#NGINX
echo -e "${YELLOW}Installing nginx${NC}"
yum install nginx -y;
systemctl enable nginx;

#PHP-FPM
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y;
yum install yum-utils -y;
yum-config-manager --disable remi-php54;
yum-config-manager --enable remi-php73;
yum -y install php php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json php-pdo php-pecl-apcu php-pecl-apcu-devel php-common php-cli php-opcache php-xmlrpc php-soap;
sed -i 's/;cgi.fix_pathinfo = 1/cgi.fix_pathinfo = 0/g' /etc/php.ini;
sed -i 's/user = apache/user = nginx/g' /etc/php-fpm.d/www.conf;
sed -i 's/group = apache/group = nginx/g' /etc/php-fpm.d/www.conf;
sed -i 's/listen = 127.0.0.1:9000/listen = \/var\/run\/php-fpm\/php-fpm.sock/g' /etc/php-fpm.d/www.conf;
sed -i 's/;listen.owner = nobody/listen.owner = nginx/g' /etc/php-fpm.d/www.conf;
sed -i 's/;listen.group = nobody/listen.group = nginx/g' /etc/php-fpm.d/www.conf;
sed -i 's/;listen.mode = 0660/listen.mode = 0660/g' /etc/php-fpm.d/www.conf;
systemctl enable php-fpm;
#systemctl start php-fpm;
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
