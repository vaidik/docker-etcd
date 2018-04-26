FROM ubuntu:14.04

WORKDIR /usr/local

RUN mkdir -p /var/lib/etcd

RUN apt-get update -y
RUN apt-get install -y wget
RUN wget https://github.com/coreos/etcd/releases/download/v2.0.11/etcd-v2.0.11-linux-amd64.tar.gz
RUN tar -zxvf etcd-v2.0.11-linux-amd64.tar.gz
RUN mv etcd-v2.0.11-linux-amd64/etcd /usr/local/bin/
RUN mv etcd-v2.0.11-linux-amd64/etcdctl /usr/local/bin/
RUN rm -rf etcd-v2.0.11-linux-amd64

EXPOSE 2379

ENTRYPOINT ["etcd", "--data-dir=/var/lib/etcd"]
