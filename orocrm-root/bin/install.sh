#!/bin/bash
echo "Building oro/crm-debian-root image..."
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y upgrade

# install base packages
apt-get install -q -y vim sudo wget curl php5-cli php5-dev \
php5-mysql php5-curl php5-gd php5-mcrypt php5-sqlite php5-xmlrpc \
php5-xsl php5-common php5-intl php5-cli php-apc git mcrypt \
python-setuptools

# install node.js
python-setuptools sudo cron
curl -sL https://deb.nodesource.com/setup | bash -
apt-get install -y nodejs npm

# install composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# install supervisor
easy_install supervisor
easy_install supervisor-stdout
