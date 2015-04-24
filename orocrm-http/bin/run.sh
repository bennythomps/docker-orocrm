#!/bin/bash
APP_ROOT="/var/www"

# update parameters yml
sed -i -e "s/%DB_HOST%/${OROCRM_DB_HOST}/g" ${APP_ROOT}/app/config/parameters.yml
sed -i -e "s/%DB_PORT%/${OROCRM_DB_PORT}/g" ${APP_ROOT}/app/config/parameters.yml
sed -i -e "s/%DB_USER%/${OROCRM_DB_USER}/g" ${APP_ROOT}/app/config/parameters.yml
sed -i -e "s/%DB_PASSWORD%/${OROCRM_DB_PASSWORD}/g" ${APP_ROOT}/app/config/parameters.yml
sed -i -e "s/%DB_NAME%/${OROCRM_DB_NAME}/g" ${APP_ROOT}/app/config/parameters.yml

sed -i -e "s/%WEBSOCKET_HOST%/${OROCRM_WEBSOCKET_HOST}/g" ${APP_ROOT}/app/config/parameters.yml
sed -i -e "s/%WEBSOCKET_PORT%/${OROCRM_WEBSOCKET_PORT}/g" ${APP_ROOT}/app/config/parameters.yml

# start all the services
/usr/local/bin/supervisord -n

