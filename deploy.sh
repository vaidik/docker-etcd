#!/bin/bash

for tag in $(sudo docker images vaidik/etcd --format "{{.Tag}}");
do
    docker push "vaidik/etcd:${tag}"
done
