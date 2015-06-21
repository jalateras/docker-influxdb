FROM alpine:edge
MAINTAINER Jim Alateras <jima@comware.com.au>

WORKDIR /golang
ENV GOPATH /golang
ENV INFLUXDB_HOME /influxdb
ENV PATH $INFLUXDB_HOME:$PATH

ADD /config/config.toml /config/

RUN \
  addgroup -S influxdb && \
  adduser -S -s /bin/bash -G influxdb influxdb

RUN \
  apk add --update bash wget git mercurial bzr go && \
  mkdir -p $GOPATH/src/github.com/influxdb && \
  cd $GOPATH/src/github.com/influxdb && \
  git clone https://github.com/influxdb/influxdb.git && \
  cd influxdb && \
  go get -u -f -t ./... && \
  go build ./... && \
  go install ./... && \
  mkdir -p $INFLUXDB_HOME && \
  cp $GOPATH/bin/influx* $INFLUXDB_HOME/   && \
  chown -R influxdb:influxdb $INFLUXDB_HOME && \
  mkdir -p /data /logs /config && \
  chown -R influxdb:influxdb /data /logs /config && \
  apk del --purge wget git mercurial bzr go  && \
  rm -rf /var/cache/apk/* /tmp/* /var/tmp/* $GOPATH


# Expose the admin port
EXPOSE 8083

# Expose the ssl http api port
EXPOSE 8084

# Expose the http api port
EXPOSE 8086

# raft protocol port used by the cluster
#EXPOSE 8090

# protobuf protocol por used for replication
#EXPOSE 8099

# volume used for storing database logs and data
VOLUME ["/data"]

# volume used for storing debug logs
VOLUME ["/logs"]

USER influxdb
CMD ["/influxdb/influxd", "-config", "/config/config.toml"]



