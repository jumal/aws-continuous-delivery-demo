#!/bin/bash -ex
if [ "$#" -ne 2 ]; then
    echo "Usage: deploy.sh SERVER TAG"
    exit 1
fi
DIRECTORY=$(cd ${0%/*} && echo $PWD)

$($$DIRECTORY/aws-ecr.sh get-login)
docker push $($DIRECTORY/get-registry.sh)/$1:$2
ecs-cli compose --file $DIRECTORY/$1/docker-compose.yml create
REVISION=`aws ecs describe-task-definition --task-definition ecscompose-$1 --query "taskDefinition.revision"`
aws ecs update-service --cluster $1 --service ecscompose-service-$1 --task-definition ecscompose-$1:$REVISION
