#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: role.sh SERVER"
    exit 1
fi
set -e
echo `aws cloudformation describe-stack-resource --stack-name amazon-ecs-cli-setup-$SERVER --logical-resource-id EcsInstancePolicy --output text --query 'StackResourceDetail.PhysicalResourceId'`
