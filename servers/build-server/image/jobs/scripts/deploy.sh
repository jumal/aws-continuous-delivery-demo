#!/bin/bash -ex
if [ "$#" -ne 1 ]; then
    echo "Usage: deploy.sh CLUSTER"
    exit 1
fi
echo "Deploying $1"
#ecs-cli configure --region $(aws configure get region) --cluster $1
#ecs-cli compose --project-name $1 create
#REVISION=$(aws ecs describe-task-definition --task-definition ecscompose-$1 --query "taskDefinition.revision")
#aws ecs update-service --cluster $1 --service ecscompose-service-$1 --task-definition ecscompose-$1:$REVISION
