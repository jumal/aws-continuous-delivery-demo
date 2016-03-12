#!/bin/bash -ex
if [ "$#" -ne 2 ]; then
    echo "Usage: get-role.sh CLUSTER PORT"
    exit 1
fi
SECURITY_GROUP=$(aws cloudformation describe-stack-resource --stack-name amazon-ecs-cli-setup-$1 --logical-resource-id EcsSecurityGroup --output text --query 'StackResourceDetail.PhysicalResourceId')
aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP --protocol tcp --port $2 --cidr 0.0.0.0/0