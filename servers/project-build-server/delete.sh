#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../lib
CLUSTER=$(basename $DIRECTORY)
ROLE=$($LIB/get-role.sh $CLUSTER)

aws iam detach-role-policy --role-name $ROLE --policy-arn arn:aws:iam::aws:policy/AWSCodePipelineCustomActionAccess
aws iam detach-role-policy --role-name $ROLE --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser
ecs-cli configure --region $(aws configure get region) --cluster $CLUSTER
ecs-cli compose --file $DIRECTORY/docker-compose.yml service rm
ecs-cli down --force
$LIB/delete-key-pair.sh $CLUSTER
