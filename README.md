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

### Where to store data (`--data-dir`)?

*Preferrably outside the container*. There are multiple ways of handling data
with containers. You can read more about the approaches [here](https://docs.docker.com/storage/).

The working directory from which `etcd` is executed is `/var/lib/etcd`. A
directory is created here with the name as described
[here in the
docs](https://coreos.com/etcd/docs/latest/op-guide/configuration.html#--data-dir).
The above path can be overridden using `etcd`'s configuration options.

Depending on the storage option that you go with, mount your storage at
`/var/lib/etcd`. As an example, here is how you would use [host
volumes](https://docs.docker.com/storage/volumes/):

```
docker run -v /my/data/dir:/var/lib/etcd docker.io/vaidik/etcd
```

Similarly, mount an existing data directory at the default data directory path
or another path you have configured for the container at run time to  have
`etcd` start with existing data.

## License

MIT Licensed
