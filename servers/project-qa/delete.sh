#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../lib
CLUSTER=$(basename $DIRECTORY)

ecs-cli configure --region $(aws configure get region) --cluster $CLUSTER
ecs-cli compose service rm
ecs-cli down --force
$LIB/delete-key-pair.sh $CLUSTER
