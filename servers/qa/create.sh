#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../lib

$LIB/create-key-pair.sh qa-server
ecs-cli configure --region `$LIB/get-region.sh` --cluster qa-server
ecs-cli up --instance-type t2.micro --size 1 --keypair qa-server --capability-iam
