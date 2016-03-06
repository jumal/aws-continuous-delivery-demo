#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../lib
CLUSTER=$(basename $DIRECTORY)

$DIRECTORY/image/create.sh

$LIB/create-key-pair.sh $CLUSTER
ecs-cli configure --region $(aws configure get region) --cluster $CLUSTER
ecs-cli up --instance-type t2.small --size 1 --keypair $CLUSTER --capability-iam
aws iam attach-role-policy --role-name $($LIB/get-role.sh $CLUSTER) --policy-arn arn:aws:iam::aws:policy/AWSCodePipelineCustomActionAccess
ecs-cli compose --file $DIRECTORY/docker-compose.yml service up
