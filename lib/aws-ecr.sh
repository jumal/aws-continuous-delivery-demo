#!/bin/bash -x
DIRECTORY=$(cd ${0%/*} && echo $PWD)
REGION=`$DIRECTORY/get-region.sh`

sed -i '' -e "s/$REGION/us-east-1/g" ~/.aws/config
aws ecr "$@"
sed -i '' -e "s/us-east-1/$REGION/g" ~/.aws/config
