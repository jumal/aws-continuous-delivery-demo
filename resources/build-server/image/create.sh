#!/bin/bash

DIRECTORY=$(cd ${0%/*} && echo $PWD)
REPOSITORIES=`$DIRECTORY/../../repositories/host.sh`

aws ecr create-repository --repository-name build-server
docker build -t build-server:1.0 $DIRECTORY
docker tag build-server:1.0 $REPOSITORIES/build-server:1.0
docker push $REPOSITORIES/build-server:1.0
