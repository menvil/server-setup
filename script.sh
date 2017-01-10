#!/bin/bash

#####################################################
#Script to confiruge Server, WebServer and WordPress#
#####################################################


#Colors settings
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color


#Welcome message
clear
echo -e "Welcome to WordPress & LAMP stack installation and configuration wizard!
First of all, we going to check all required packeges..."

#Checking packages
echo -e "${YELLOW}Checking packages...${NC}"
echo -e "List of required packeges: nano, zip, unzip, mc, htop, fail2ban, nginx & php, mysql(MariaDB), sysv-rc-conf, php7, varnish, curl, wget, curl"

read -r -p "Do you want to check packeges? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 
		
apt-get update

NANO=$(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing nano${NC}"
    apt-get install nano --yes;
    elif [ $(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}nano is installed!${NC}"
  fi

ZIP=$(dpkg-query -W -f='${Status}' zip 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' zip 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing zip${NC}"
    apt-get install zip --yes;
    elif [ $(dpkg-query -W -f='${Status}' zip 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}zip is installed!${NC}"
  fi

MC=$(dpkg-query -W -f='${Status}' mc 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' mc 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing mc${NC}"
    apt-get install mc --yes;
    elif [ $(dpkg-query -W -f='${Status}' mc 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}mc is installed!${NC}"
  fi

HTOP=$(dpkg-query -W -f='${Status}' htop 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' htop 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing htop${NC}"
    apt-get install htop --yes;
    elif [ $(dpkg-query -W -f='${Status}' htop 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}htop is installed!${NC}"
  fi

FAIL2BAN=$(dpkg-query -W -f='${Status}' fail2ban 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' fail2ban 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing fail2ban${NC}"
    apt-get install fail2ban --yes;
    elif [ $(dpkg-query -W -f='${Status}' fail2ban 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}fail2ban is installed!${NC}"
  fi

SYSRCCONF=$(dpkg-query -W -f='${Status}' sysv-rc-conf 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' sysv-rc-conf 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing sysv-rc-conf${NC}"
    apt-get install sysv-rc-conf --yes;
    elif [ $(dpkg-query -W -f='${Status}' sysv-rc-conf 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}sysv-rc-conf is installed!${NC}"
  fi
	
NGINX=$(dpkg-query -W -f='${Status}' nginx 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' nginx 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing nginx${NC}"
		apt-get remove apache2 --yes;
    apt-get install nginx --yes;
    elif [ $(dpkg-query -W -f='${Status}' nginx 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}nginx is installed!${NC}"
  fi

MYSQL=$(dpkg-query -W -f='${Status}' mariadb-server 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' mariadb-server 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing mariadb-server${NC}"
    apt-get install mariadb-server --yes;
    elif [ $(dpkg-query -W -f='${Status}' mariadb-server 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}mariadb-server is installed!${NC}"
  fi
		
PHP7=$(dpkg-query -W -f='${Status}' php7.0 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' php7.0 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing php7.0${NC}"
    apt-get install php7.0 --yes;
    elif [ $(dpkg-query -W -f='${Status}' php7.0 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}php7.0 is installed!${NC}"
  fi

PHP7FPM=$(dpkg-query -W -f='${Status}' php7.0-fpm 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' php7.0-fpm 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing php7.0-fpm${NC}"
    apt-get install php7.0-fpm --yes;
    elif [ $(dpkg-query -W -f='${Status}' php7.0-fpm 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}php7.0-fpm is installed!${NC}"
  fi
	
PHP7MYSQL=$(dpkg-query -W -f='${Status}' php7.0-mysql 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' php7.0-mysql 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing php7.0-mysql${NC}"
    apt-get install php7.0-mysql --yes;
    elif [ $(dpkg-query -W -f='${Status}' php7.0-mysql 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}php7.0-mysql is installed!${NC}"
  fi

PHP7MYSQLND=$(dpkg-query -W -f='${Status}' php7.0-mysqlnd 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' php7.0-mysqlnd 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing php7.0-mysqlnd${NC}"
    apt-get install php7.0-mysqlnd --yes;
    elif [ $(dpkg-query -W -f='${Status}' php7.0-mysqlnd 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}php7.0-mysqlnd is installed!${NC}"
  fi
	
PHP7CURL=$(dpkg-query -W -f='${Status}' php7.0-curl 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' php7.0-curl 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing php7.0-curl${NC}"
    apt-get install php7.0-curl --yes;
    elif [ $(dpkg-query -W -f='${Status}' php7.0-curl 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}php7.0-curl is installed!${NC}"
  fi

WGET=$(dpkg-query -W -f='${Status}' wget 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' wget 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing wget${NC}"
    apt-get install wget --yes;
    elif [ $(dpkg-query -W -f='${Status}' wget 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}wget is installed!${NC}"
  fi

CURL=$(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing curl${NC}"
    apt-get install curl --yes;
    elif [ $(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}curl is installed!${NC}"
  fi
	
VARNISH=$(dpkg-query -W -f='${Status}' varnish 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' varnish 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing varnish${NC}"
    apt-get install varnish --yes;
    elif [ $(dpkg-query -W -f='${Status}' varnish 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}varnish is installed!${NC}"
  fi	
	
  ;;

    *)

  echo -e "${RED}
  Packeges check is ignored! 
  Please be aware, that nginx, mysql and other software may not be installed!
  ${NC}"

  ;;
esac


#creating user
	echo -e "${YELLOW}Adding separate user & creating website home folder for secure running of your website...${NC}"

  echo -e "${YELLOW}Please, enter new username: ${NC}"
  read username
  echo -e "${YELLOW}Please enter website name: ${NC}"
  read websitename
  groupadd $username
  adduser --home /var/www/$username/$websitename --ingroup $username $username
  mkdir /var/www/$username/$websitename/www
  chown -R $username:$username /var/www/$username/$websitename
  echo -e "${GREEN}User, group and home folder were succesfully created!
  Username: $username
  Group: $username
  Home folder: /var/www/$username/$websitename
  Website folder: /var/www/$username/$websitename/www${NC}"
