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
    apt-get install mariadb-server mariadb-client --yes;
    systemctl start mariadb;
    mysql_secure_installation;
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

PHP7GD=$(dpkg-query -W -f='${Status}' php7.0-gd 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' php7.0-gd 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing php7.0-gd${NC}"
    apt-get install php7.0-gd --yes;
    elif [ $(dpkg-query -W -f='${Status}' php7.0-gd 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}php7.0-gd is installed!${NC}"
  fi

PHP7CLI=$(dpkg-query -W -f='${Status}' php7.0-cli 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' php7.0-cli 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing php7.0-cli${NC}"
    apt-get install php7.0-cli --yes;
    elif [ $(dpkg-query -W -f='${Status}' php7.0-cli 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}php7.0-cli is installed!${NC}"
  fi

PHP7ZIP=$(dpkg-query -W -f='${Status}' php7.0-zip 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' php7.0-zip 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing php7.0-zip${NC}"
    apt-get install php7.0-zip --yes;
    elif [ $(dpkg-query -W -f='${Status}' php7.0-zip 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}php7.0-zip is installed!${NC}"
  fi

PHP7BZ2=$(dpkg-query -W -f='${Status}' php7.0-bz2 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' php7.0-bz2 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing php7.0-bz2${NC}"
    apt-get install php7.0-bz2 --yes;
    elif [ $(dpkg-query -W -f='${Status}' php7.0-bz2 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}php7.0-bz2 is installed!${NC}"
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
  

#downloading WordPress, unpacking, adding basic pack of plugins, creating .htaccess with optimal & secure configuration
echo -e "${YELLOW}On this step we going to download latest version of WordPress with EN or RUS language, set optimal & secure configuration and add basic set of plugins...${NC}"

read -r -p "Do you want to install WordPress & automatically set optimal and secure configuration with basic set of plugins? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 

  echo -e "${GREEN}Please, choose WordPress language you need (set RUS or ENG): "
  read wordpress_lang

  if [ "$wordpress_lang" == 'RUS' ];
    then
    wget https://ru.wordpress.org/latest-ru_RU.zip -O /tmp/$wordpress_lang.zip
  else
    wget https://wordpress.org/latest.zip -O /tmp/$wordpress_lang.zip
  fi

  echo -e "Unpacking WordPress into website home directory..."
  sleep 5
  unzip /tmp/$wordpress_lang.zip -d /var/www/$username/$websitename/www/
  mv /var/www/$username/$websitename/www/wordpress/* /var/www/$username/$websitename/www
  rm -rf /var/www/$username/$websitename/www/wordpress
  rm /tmp/$wordpress_lang.zip
  mkdir /var/www/$username/$websitename/www/wp-content/uploads
  chmod -R 777 /var/www/$username/$websitename/www/wp-content/uploads

  echo -e "${RED}WordPress and plugins were not downloaded & installed. You can do this manually or re run this script.${NC}"

        ;;
esac


#cration of robots.txt
echo -e "${YELLOW}Creation of robots.txt file...${NC}"
sleep 3
cat >/var/www/$username/$websitename/www/robots.txt <<EOL
User-agent: *
Disallow: /cgi-bin
Disallow: /wp-admin/
Disallow: /wp-includes/
Disallow: /wp-content/
Disallow: /wp-content/plugins/
Disallow: /wp-content/themes/
Disallow: /trackback
Disallow: */trackback
Disallow: */*/trackback
Disallow: */*/feed/*/
Disallow: */feed
Disallow: /*?*
Disallow: /tag
Disallow: /?author=*
EOL

echo -e "${GREEN}File robots.txt was succesfully created!
Setting correct rights on user's home directory and 755 rights on robots.txt${NC}"
sleep 3

chmod 755 /var/www/$username/$websitename/www/robots.txt


#creating of swap
echo -e "On next step we going to create SWAP (it should be your RAM x2)..."

read -r -p "Do you need SWAP? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 

  RAM="`free -m | grep Mem | awk '{print $2}'`"
  swap_allowed=$(($RAM * 2))
  swap=$swap_allowed"M"
  fallocate -l $swap /var/swap.img
  chmod 600 /var/swap.img
  mkswap /var/swap.img
  swapon /var/swap.img

  echo -e "${GREEN}RAM detected: $RAM
  Swap was created: $swap${NC}"
  sleep 5

        ;;
    *)

  echo -e "${RED}You didn't create any swap for faster system working. You can do this manually or re run this script.${NC}"

        ;;
esac



echo -e "${GREEN}Configuring fail2ban...${NC}"
sleep 3
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.conf-old
cat >/etc/fail2ban/jail.conf <<EOL
[DEFAULT]

ignoreip = 127.0.0.1/8
ignorecommand =
bantime  = 1200
findtime = 1200
maxretry = 3
backend = auto
usedns = warn
destemail = $domain_email
sendername = Fail2Ban
sender = fail2ban@localhost
banaction = iptables-multiport
mta = sendmail

# Default protocol
protocol = tcp
# Specify chain where jumps would need to be added in iptables-* actions
chain = INPUT
# ban & send an e-mail with whois report to the destemail.
action_mw = %(banaction)s[name=%(__name__)s, port="%(port)s", protocol="%(protocol)s", chain="%(chain)s"]
              %(mta)s-whois[name=%(__name__)s, dest="%(destemail)s", protocol="%(protocol)s", chain="%(chain)s", sendername="%(sendername)s"]
action = %(action_mw)s

[ssh]
enabled  = true
port     = ssh
filter   = sshd
logpath  = /var/log/auth.log
maxretry = 5

[ssh-ddos]
enabled  = true
port     = ssh
filter   = sshd-ddos
logpath  = /var/log/auth.log
maxretry = 5

EOL

service fail2ban restart

echo -e "${GREEN}fail2ban configuration finished!
fail2ban service was restarted, default confige backuped at /etc/fail2ban/jail.conf-old
Jails were set for: ssh bruteforce, ssh ddos, apache overflows${NC}"

sleep 5

service mysql restart

echo -e "${GREEN}Services succesfully restarted!${NC}"
sleep 3

echo -e "${GREEN}Adding user & database for WordPress, setting wp-config.php...${NC}"
echo -e "Please, set username for database: "
read db_user
echo -e "Please, set password for database user: "
read db_pass

mysql -u root -p <<EOF
CREATE USER '$db_user'@'localhost' IDENTIFIED BY '$db_pass';
CREATE DATABASE IF NOT EXISTS $db_user;
GRANT ALL PRIVILEGES ON $db_user.* TO '$db_user'@'localhost';
ALTER DATABASE $db_user CHARACTER SET utf8 COLLATE utf8_general_ci;
EOF

cat >/var/www/$username/$websitename/www/wp-config.php <<EOL
<?php

define('DB_NAME', '$db_user');

define('DB_USER', '$db_user');

define('DB_PASSWORD', '$db_pass');

define('DB_HOST', 'localhost');

define('DB_CHARSET', 'utf8');

define('DB_COLLATE', '');

define('AUTH_KEY',         '$db_user');
define('SECURE_AUTH_KEY',  '$db_user');
define('LOGGED_IN_KEY',    '$db_user');
define('NONCE_KEY',        '$db_user');
define('AUTH_SALT',        '$db_user');
define('SECURE_AUTH_SALT', '$db_user');
define('LOGGED_IN_SALT',   '$db_user');
define('NONCE_SALT',       '$db_user');

\$table_prefix  = 'wp_';

define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
EOL

chown -R $username:$username /var/www/$username
echo -e "${GREEN}Database user, database and wp-config.php were succesfully created & configured!${NC}"
sleep 3
echo -e "Installation & configuration succesfully finished.
e-mail: menvil.menvil@gmail.com
Bye!"  
  
