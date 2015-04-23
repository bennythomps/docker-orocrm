FROM oro/crm-debian-base
MAINTAINER Sergey Cherepanov <scherepanov@magecore.com>

COPY bin/* /opt/bin/
COPY data/* /tmp/

RUN chmod +x /opt/bin/install.sh && /opt/bin/install.sh && rm -rf /opt/bin
