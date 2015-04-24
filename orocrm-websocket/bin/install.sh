#!/bin/bash
echo "Building oro/crm-debian-webscoket image..."
export DEBIAN_FRONTEND=noninteractive
MEMORY_LIMIT="512"

# configure php
sed -i -e "s/;date.timezone\s=/date.timezone = UTC/g" /etc/php5/cli/php.ini
sed -i -e "s/short_open_tag\s=\s*.*/short_open_tag = Off/g" /etc/php5/cli/php.ini
sed -i -e "s/memory_limit\s=\s.*/memory_limit = ${MEMORY_LIMIT}M/g" /etc/php5/cli/php.ini

# supervisor config
mv /tmp/supervisord.conf /etc/supervisord.conf
