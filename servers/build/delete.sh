#!/bin/bash
set -e
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../lib

aws iam detach-role-policy --role-name `$LIB/get-role.sh` --policy-arn arn:aws:iam::aws:policy/AWSCodePipelineCustomActionAccess
ecs-cli configure --region `$LIB/get-region.sh` --cluster build-server
ecs-cli down --force
$LIB/delete-key-pair.sh build-server
