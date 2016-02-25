#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../../../lib

$LIB/aws-ecr.sh delete-repository --repository-name build-server --force
