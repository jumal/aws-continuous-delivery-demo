#!/bin/bash
set -e
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../../lib
REGISTRY=`$LIB/get-registry.sh`
REGION=`$LIB/get-region.sh`

$LIB/aws-ecr.sh create-repository --repository-name build-server
#sed -i '' -e "s/us-east-1/$REGION/g" $DIRECTORY/jobs.groovy
docker build -t build-server $DIRECTORY
docker tag build-server:latest $REGISTRY/build-server:latest
docker push $REGISTRY/build-server:latest
