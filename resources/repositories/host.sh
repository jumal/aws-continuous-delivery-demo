#!/bin/bash

LOGIN_COMMAND=`aws ecr get-login`
HOST=`echo $LOGIN_COMMAND | awk '{print $9}' | sed 's/^https:\/\///g'`
echo $HOST
