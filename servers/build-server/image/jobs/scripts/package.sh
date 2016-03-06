#!/bin/bash -ex
TAG=latest
LOGIN=$(aws --region us-east-1 ecr get-login)
REGISTRY=$(echo $LOGIN | awk '{print $9}' | sed 's/^https:\/\///g')

docker build -t project .
docker tag project:$TAG $REGISTRY/project:$TAG
$LOGIN
docker push $REGISTRY/project:$TAG
sed -i '' -e "s/REGISTRY/$REGISTRY/g" -e "s/TAG/$TAG/g" docker-compose.yml
