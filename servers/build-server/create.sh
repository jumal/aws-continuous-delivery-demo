#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../lib
REGISTRY=`$LIB/get-registry.sh`
CLUSTER=$(basename $DIRECTORY)

$DIRECTORY/image/create.sh

$LIB/create-key-pair.sh $CLUSTER
ecs-cli configure --region $(aws configure get region) --cluster $CLUSTER
ecs-cli up --instance-type t2.micro --size 1 --keypair $CLUSTER --capability-iam
aws iam attach-role-policy --role-name `$LIB/get-role.sh $CLUSTER` --policy-arn arn:aws:iam::aws:policy/AWSCodePipelineCustomActionAccess
sed -i '' -e "s/REGISTRY/$REGISTRY/g" $DIRECTORY/docker-compose.yml
ecs-cli compose --file $DIRECTORY/docker-compose.yml service up
