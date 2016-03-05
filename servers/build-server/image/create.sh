#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../../lib
REGISTRY=`$LIB/get-registry.sh`
REGION=`$LIB/get-region.sh`

$(aws --region us-east-1 ecr get-login)
aws --region us-east-1 ecr create-repository --repository-name build-server
#for job in $DIRECTORY/jobs/*; do
#    sed -i '' -e "s/us-east-1/$REGION/g" $job
#done
docker build -t build-server $DIRECTORY
docker tag build-server:latest $REGISTRY/build-server:latest
docker push $REGISTRY/build-server:latest
