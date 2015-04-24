#!/bin/bash
echo "Building oro/crm-debian-base image..."
export DEBIAN_FRONTEND=noninteractive
MEMORY_LIMIT="256"
UPLOAD_LIMIT="128"

# install base packages
apt-get install -q -y php5-fpm nginx

# nginx config
sed -i -e"s/keepalive_timeout\s*65/keepalive_timeout 2/" /etc/nginx/nginx.conf
sed -i -e"s/keepalive_timeout 2/keepalive_timeout 2;\n\tclient_max_body_size ${UPLOAD_LIMIT}m/" /etc/nginx/nginx.conf
echo "daemon off;" >> /etc/nginx/nginx.conf

unlink /etc/nginx/sites-enabled/default
mv /tmp/nginx/crm.conf /etc/nginx/sites-available/orocrm
ln -s /etc/nginx/sites-available/orocrm /etc/nginx/sites-enabled/orocrm

# php config
sed -i -e "s/upload_max_filesize\s*=\s*2M/upload_max_filesize = ${UPLOAD_LIMIT}M/g" /etc/php5/fpm/php.ini
sed -i -e "s/memory_limit\s=\s.*/memory_limit = ${MEMORY_LIMIT}M/g" /etc/php5/fpm/php.ini
sed -i -e "s/post_max_size\s*=\s*8M/post_max_size = ${UPLOAD_LIMIT}M/g" /etc/php5/fpm/php.ini

# php-fpm config
sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
sed -i -e "s/;catch_workers_output\s*=\s*yes/catch_workers_output = yes/g" /etc/php5/fpm/pool.d/www.conf
find /etc/php5/cli/conf.d/ -name "*.ini" -exec sed -i -re 's/^(\s*)#(.*)/\1;\2/g' {} \;

# supervisor config
mv /tmp/supervisord.conf /etc/supervisord.conf
