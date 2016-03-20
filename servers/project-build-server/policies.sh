#!/bin/bash -e
if [ "$#" -ne 1 ]; then
    echo "Usage: policies.sh attach|detach"
    exit 1
fi
DIRECTORY=$(cd ${0%/*} && echo $PWD)
CLUSTER=$(basename ${DIRECTORY})
ROLE=$(aws cloudformation describe-stack-resource --stack-name amazon-ecs-cli-setup-${CLUSTER} --logical-resource-id EcsInstancePolicy --output text --query 'StackResourceDetail.PhysicalResourceId')
for policy in AWSCodePipelineCustomActionAccess AmazonEC2ContainerRegistryPowerUser AmazonEC2ContainerServiceFullAccess; do
    aws iam $1-role-policy --role-name ${ROLE} --policy-arn arn:aws:iam::aws:policy/${policy}
done
