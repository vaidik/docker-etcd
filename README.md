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

### Using `etcdctl`

`etcdctl` comes with this container image and can be found in `PATH`.

While developing locally, you can connect attach an interactive shell in your
container and just use `etcdctl` directly.

In production-like environments or where your `etcd` container is not running on
your local machine, you can also use this container image to run `etcd`
separately. Consider this example:

Run the server in a separate container:

```
docker run --name etcd_server docker.io/vaidik/etcd --listen-client-urls='http://0.0.0.0:2379,http://0.0.0.0:4001' --advertise-client-urls='http://0.0.0.0:2379,http://0.0.0.0:4001'
```

Run the `etcdctl` client in a separate container like so:

```
docker run --link etcd_server:etcd_server --entrypoint etcdctl docker.io/vaidik/etcd --no-sync -C 'http://etcd_server:4001' set foo bar
```

**Note:** In some older versions of `etcd`, `--no-sync` option is required to
make `etcdctl` work with `-C` flag. See [this
issue](https://github.com/coreos/etcd/issues/2734).

### Configuration

etcd can be configured using command line flags and environment variables as
documented [here](https://coreos.com/etcd/docs/latest/op-guide/configuration.html).

To change configuration for your container, you can pass the command line
arguments at the end of the `docker run` command like you pass to the `etcd`
server, like so:

```
docker run docker.io/vaidik/etcd --data-dir='/opt/etcd/data'
```

If you prefer using environment variables, you need to execute `docker run`
command slightly differently, like so:

```
docker run docker.io/vaidik/etcd ETCD_DATA_DIR='/opt/etcd/data'
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

This container image contains `etcd` is under the Apache 2.0 license. See the
licensing information [here](https://github.com/coreos/etcd/#license).

Like other container images, this image contains some other software also (like
`bash`) that may be under different licenses.
