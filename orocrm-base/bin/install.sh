#!/bin/bash
echo "Building oro/crm-debian-base image..."
APP_ROOT="/var/www"
USER="www-data"

function as_user {
    sudo -u ${USER} $@
}

# download OroCRM
as_user wget -O /tmp/crm-application-1.6.1.tar.gz -N -P /tmp https://github.com/orocrm/crm-application/archive/1.6.1.tar.gz
as_user tar -zxf /tmp/crm-application-1.6.1.tar.gz -C /tmp
mv /tmp/crm-application-1.6.1 ${APP_ROOT}
rm /tmp/crm-application-1.6.1.tar.gz
as_user composer install -d ${APP_ROOT}
as_user mv /tmp/parameters.yml ${APP_ROOT}/app/config/parameters.yml
as_user mv /tmp/OroRequirements.php ${APP_ROOT}/app/OroRequirements.php
