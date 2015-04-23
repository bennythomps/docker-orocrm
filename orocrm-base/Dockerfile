FROM oro/crm-debian-root
MAINTAINER Sergey Cherepanov <scherepanov@magecore.com>

COPY bin/* /opt/bin/
COPY data/* /tmp/

RUN chmod +x /opt/bin/install.sh && /opt/bin/install.sh && rm -rf /opt/bin
