FROM debian:7.8
MAINTAINER Sergey Cherepanov <scherepanov@magecore.com>

COPY bin/* /opt/bin/
RUN chmod +x /opt/bin/install.sh && sleep 1 && /opt/bin/install.sh && rm -rf /opt/bin
