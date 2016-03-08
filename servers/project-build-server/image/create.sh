#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../../lib
TAG=latest
REGISTRY=$($LIB/get-registry.sh)
REGION=$(aws configure get region)

#for job in $DIRECTORY/jobs/*; do
#    sed -i '' -e "s/us-east-1/$REGION/g" $job
#done
docker build -t project-build-server:$TAG $DIRECTORY
docker tag project-build-server:$TAG $REGISTRY/project-build-server:$TAG
$(aws --region us-east-1 ecr get-login)
docker push $REGISTRY/project-build-server:$TAG
sed -i '' -e "s/REGISTRY/$REGISTRY/g" -e "s/TAG/$TAG/g" $DIRECTORY/../docker-compose.yml
