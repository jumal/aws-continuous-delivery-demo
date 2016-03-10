#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../lib
CLUSTER=$(basename $DIRECTORY)

$DIRECTORY/jenkins/create.sh
$DIRECTORY/sonarqube/create.sh

$LIB/create-key-pair.sh $CLUSTER
ecs-cli configure --region $(aws configure get region) --cluster $CLUSTER
ecs-cli up --instance-type t2.small --size 1 --keypair $CLUSTER --capability-iam
ROLE=$($LIB/get-role.sh $CLUSTER)
aws iam attach-role-policy --role-name $ROLE --policy-arn arn:aws:iam::aws:policy/AWSCodePipelineCustomActionAccess
aws iam attach-role-policy --role-name $ROLE --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser
ecs-cli compose --file $DIRECTORY/docker-compose.yml service up


