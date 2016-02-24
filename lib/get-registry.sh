#!/bin/bash
set -e
LOGIN_COMMAND=`aws ecr get-login`
echo `echo $LOGIN_COMMAND | awk '{print $9}' | sed 's/^https:\/\///g'`
