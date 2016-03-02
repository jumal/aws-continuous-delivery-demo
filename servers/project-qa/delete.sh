#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../lib
CLUSTER=$(basename $DIRECTORY)

ecs-cli configure --region `$LIB/get-region.sh` --cluster $CLUSTER
ecs-cli down --force
$LIB/delete-key-pair.sh $CLUSTER
