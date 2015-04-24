FROM oro/crm-debian-base
MAINTAINER Sergey Cherepanov <scherepanov@magecore.com>

ENV DEBIAN_FRONTEND noninteractive

COPY bin/* /opt/bin/
COPY data/* /tmp/

RUN chmod +x /opt/bin/install.sh && sleep 1 && /opt/bin/install.sh && rm -rf /opt/bin

EXPOSE 80

CMD ["/bin/bash", "/opt/bin/run.sh"]
