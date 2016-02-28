#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../lib

ecs-cli configure --region `$LIB/get-region.sh` --cluster qa-server
ecs-cli down --force
$LIB/delete-key-pair.sh qa-server
