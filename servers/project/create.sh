#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../lib
CLUSTER=$(basename $DIRECTORY)

$LIB/create-key-pair.sh $CLUSTER
ecs-cli configure --region `$LIB/get-region.sh` --cluster $CLUSTER
ecs-cli up --instance-type t2.micro --size 2 --keypair $CLUSTER --capability-iam
