#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=${DIRECTORY}/../../../lib
TAG=latest
REGISTRY=$(${LIB}/get-registry.sh)

docker build -t project-sonarqube:${TAG} ${DIRECTORY}
docker tag project-sonarqube:${TAG} ${REGISTRY}/project-sonarqube:${TAG}
$(aws --region us-east-1 ecr get-login)
docker push ${REGISTRY}/project-sonarqube:${TAG}
sed -i '' -e "s|build: sonarqube|image: $REGISTRY/project-sonarqube:$TAG|g" ${DIRECTORY}/../docker-compose.yml
