#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../lib
CLUSTER=$(basename $DIRECTORY)

aws iam detach-role-policy --role-name `$LIB/get-role.sh $CLUSTER` --policy-arn arn:aws:iam::aws:policy/AWSCodePipelineCustomActionAccess
ecs-cli configure --region `$LIB/get-region.sh` --cluster $CLUSTER
ecs-cli compose --file $DIRECTORY/docker-compose.yml service rm
ecs-cli down --force
$LIB/delete-key-pair.sh $CLUSTER

$DIRECTORY/image/delete.sh
