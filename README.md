# docker-etcd

*Unofficial* docker image for [etcd](https://coreos.com/etcd/).

## Usage

```
docker pull docker.io/vaidik/etcd
docker run -ivt docker.io/vaidik/etcd
```

### Viewing Logs

Logs are sent to the `stdout` stream of the container. Use the following command
to see the logs:

```
docker logs -f <container-name>
```

### Using the `etcd` client

### Configuration

etcd can be configured using command line flags and environment variables as
documented [here](https://coreos.com/etcd/docs/latest/op-guide/configuration.html).

To change configuration for your container, you can pass the command line
arguments at the end of the `docker run` command like you pass to the `etcd`
server, like so:

```
docker run -d docker.io/vaidik/etcd --listen-client-urls='http://0.0.0.0:2379,http://0.0.0.0:4001' --advertise-client-urls='http://localhost:2379,http://localhost:4001'
```

If you prefer using environment variables, you need to execute `docker run`
command slightly differently, like so:

```
docker run -d -e ETCD_LISTEN_CLIENT_URLS='http://0.0.0.0:2379,http://0.0.0.0:4001' -e ETCD_ADVERTISE_CLIENT_URLS='http://localhost:2379,http://localhost:4001' docker.io/vaidik/etcd
```

### Where to store data?

### Usage against an existing database

### Creating dumps / backups

## License

MIT Licensed
