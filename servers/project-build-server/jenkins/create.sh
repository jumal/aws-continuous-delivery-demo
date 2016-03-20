#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=${DIRECTORY}/../../../lib
TAG=latest
REGISTRY=$(${LIB}/get-registry.sh)
REGION=$(aws configure get region)

#for job in $DIRECTORY/jobs/*; do
#    sed -i '' -e "s/us-east-1/$REGION/g" $job
#done
docker build -t project-jenkins:${TAG} ${DIRECTORY}
docker tag project-jenkins:${TAG} ${REGISTRY}/project-jenkins:${TAG}
$(aws --region us-east-1 ecr get-login)
docker push ${REGISTRY}/project-jenkins:${TAG}
sed -i '' -e "s|build: jenkins|image: $REGISTRY/project-jenkins:$TAG|g" ${DIRECTORY}/../docker-compose.yml
