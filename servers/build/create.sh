#!/bin/bash
set -e
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../lib

$DIRECTORY/image/create.sh

$LIB/create-key-pair.sh build-server
ecs-cli configure --region `$LIB/get-region.sh` --cluster build-server
ecs-cli up --instance-type t2.micro --size 1 --keypair build-server --capability-iam
aws iam attach-role-policy --role-name `$LIB/get-role.sh build-server` --policy-arn arn:aws:iam::aws:policy/AWSCodePipelineCustomActionAccess
ecs-cli compose --file $DIRECTORY/docker-compose.yml up
