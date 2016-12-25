
#!/usr/bin/env bash

#VAGRANT SETUP BY KANAKA KISHORE KANDREGULA

# Use single quotes instead of double quotes to make it work with special-character passwords
# This will be be the password for mysql
PASSWORD='pAsSwOrD'

sudo apt-get install linux-headers-generic build-essential dkms

# create project folder
sudo mkdir -p "/var/www/html"

# update / upgrade
sudo apt-get update
sudo apt-get -y upgrade

# install apache 2 and php 7.0
sudo apt-get install -y apache2
sudo apt-get -y install software-properties-common
sudo apt-get -q -y install python-software-properties
sudo apt-get -y update
sudo add-apt-repository ppa:ondrej/php
sudo apt-get -y update
sudo apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-gd php7.0-mysql php7.0-zip php7.0-bcmath php7.0-iconv php7.0-mcrypt php7.0-curl php7.0-intl php7.0-mbstring php7.0-xml

# install mysql and give password to installer
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo sudo apt-get install -q -y mysql-server-5.6 mysql-client-5.6

# setup hosts file
VHOST=$(cat <<EOF
ServerName localhost
<VirtualHost *:80>
    DocumentRoot "/var/www/html"
    <Directory "/var/www/html">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

echo "date.timezone = Europe/London" >> /etc/php/7.0/apache2/php.ini


#Increasing Memory limit to 2 Gigabytes as per Magento 2 Specifications
echo "memory_limit = 2G" >> /etc/php/7.0/apache2/php.ini

# enable mod_rewrite
sudo a2enmod rewrite

# restart apache # while setting up vagrant, first few times restarts might fail but later it will be OK.
service apache2 restart

# install git
sudo apt-get -y install git

#install htop
sudo apt-get install htop

# install Composer
if [ ! -f /usr/local/bin/composer ]; then
    cd /tmp
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
fi

# add GB locale (For US replace en_GB with en_US )
sudo locale-gen en_GB.UTF-8

#Thank you for Using this Setup