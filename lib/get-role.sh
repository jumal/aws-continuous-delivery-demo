#!/bin/bash -ex
if [ "$#" -ne 1 ]; then
    echo "Usage: get-role.sh CLUSTER"
    exit 1
fi
echo $(aws cloudformation describe-stack-resource --stack-name amazon-ecs-cli-setup-$1 --logical-resource-id EcsInstancePolicy --output text --query 'StackResourceDetail.PhysicalResourceId')
