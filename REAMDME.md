# docker-influxdb

Build a container using the latest version of [influxdb](https://influxdb.com/).


### Building

To build 

```
docker build --tag <userId>/influxdb .
```

### Running

To run the container as a daemon and therefore a single node influxdb cluster

```
docker run -d --name influxdb <userId>/influxdb
```

If everything works as expected then you can check the logs

```
docker logs influxdb


 8888888           .d888 888                   8888888b.  888888b.
   888            d88P"  888                   888  "Y88b 888  "88b
   888            888    888                   888    888 888  .88P
   888   88888b.  888888 888 888  888 888  888 888    888 8888888K.
   888   888 "88b 888    888 888  888  Y8bd8P' 888    888 888  "Y88b
   888   888  888 888    888 888  888   X88K   888    888 888    888
   888   888  888 888    888 Y88b 888 .d8""8b. 888  .d88P 888   d88P
 8888888 888  888 888    888  "Y88888 888  888 8888888P"  8888888P"

GOMAXPROCS set to 1
no configuration provided, using default settings
2015/06/18 04:51:17 [INFO] raft: Node at 127.0.0.1:8088 [Follower] entering Follower state
2015/06/18 04:51:18 [WARN] raft: Heartbeat timeout reached, starting election
2015/06/18 04:51:18 [INFO] raft: Node at 127.0.0.1:8088 [Candidate] entering Candidate state
2015/06/18 04:51:18 [DEBUG] raft: Votes needed: 1
2015/06/18 04:51:18 [DEBUG] raft: Vote granted. Tally: 1
2015/06/18 04:51:18 [INFO] raft: Election won. Tally: 1
2015/06/18 04:51:18 [INFO] raft: Node at 127.0.0.1:8088 [Leader] entering Leader state
2015/06/18 04:51:18 [INFO] raft: Disabling EnableSingleNode (bootstrap)
2015/06/18 04:51:18 [DEBUG] raft: Node 127.0.0.1:8088 updated peer set (2): [127.0.0.1:8088]
2015/06/18 04:51:18 created local node: id=1, host=127.0.0.1:8088
[httpd] 2015/06/18 04:51:18 listening on HTTP: [::]:8086
2015/06/18 04:51:18 Sending anonymous usage statistics to m.influxdb.com
```

### Attaching to the container

You can attach to a running instance of a container and get a shell to influxdb

```
docker exec -it influxdb bash


influxdb@8069b1e48d4e:/$ /opt/influxdb/influx  
Connected to http://localhost:8086 version FIXME
InfluxDB shell 0.9.0
> 
```
