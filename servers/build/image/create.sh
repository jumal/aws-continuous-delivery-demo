#!/bin/bash
set -e
DIRECTORY=$(cd ${0%/*} && echo $PWD)
REGISTRY=`$DIRECTORY/../../lib/get-registry.sh`

aws ecr create-repository --repository-name build-server
docker build -t build-server $DIRECTORY
docker tag build-server:latest $REGISTRY/build-server:latest
docker push $REGISTRY/build-server:latest
