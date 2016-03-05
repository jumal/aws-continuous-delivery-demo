#!/bin/bash -ex
if [ "$#" -ne 1 ]; then
    echo "Usage: deploy.sh CLUSTER"
    exit 1
fi
LIB=../seed/scripts
REGISTRY=`$LIB/get-registry.sh`

ecs-cli configure --region `$LIB/get-region.sh` --cluster $CLUSTER
sed -i '' -e "s/REGISTRY/$REGISTRY/g" -e "s/TAG/$GIT_COMMIT/g" docker-compose.yml
ecs-cli compose --project-name $CLUSTER create
REVISION=`aws ecs describe-task-definition --task-definition ecscompose-$CLUSTER --query "taskDefinition.revision"`
aws ecs update-service --cluster $CLUSTER --service ecscompose-service-$CLUSTER --task-definition ecscompose-$CLUSTER:$REVISION
