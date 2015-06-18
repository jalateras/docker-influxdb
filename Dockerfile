FROM ubuntu:latest
MAINTAINER Jim Alateras <jima@comware.com.au>


RUN \
  apt-get -y update && \
  apt-get install -y wget && \
  apt-get -y clean && \
  apt-get -y autoremove

RUN \
  useradd -r --shell /bin/bash --user-group --create-home influxdb

RUN \
  wget https://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb --directory-prefix /tmp  && \
  dpkg -i /tmp/influxdb_latest_amd64.deb && \
  rm -rf /tmp/* /var/tmp/*


EXPOSE 8083
EXPOSE 8084
EXPOSE 8086

VOLUME ["/data"]

USER influxdb

CMD ["/opt/influxdb/influxd"]




