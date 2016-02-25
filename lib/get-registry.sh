#!/bin/bash
set -e
DIRECTORY=$(cd ${0%/*} && echo $PWD)

LOGIN_COMMAND=`$DIRECTORY/aws-ecr.sh get-login`
echo `echo $LOGIN_COMMAND | awk '{print $9}' | sed 's/^https:\/\///g'`
