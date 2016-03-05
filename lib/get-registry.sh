#!/bin/bash -ex
LOGIN_COMMAND=`aws --region us-east-1 ecr get-login`
echo `echo $LOGIN_COMMAND | awk '{print $9}' | sed 's/^https:\/\///g'`
