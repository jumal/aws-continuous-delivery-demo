#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=$DIRECTORY/../lib
GITHUB_TOKEN=$(cat $DIRECTORY/github-token.oauth)
BUILD_SERVER_URL=http://$($LIB/get-ip.sh build-server)

set +e
aws --region us-east-1 cloudformation create-stack --stack-name project-pipeline-action-types --template-body file:///$DIRECTORY/action-types.json --parameters ParameterKey=buildServerURL,ParameterValue=$BUILD_SERVER_URL
set -e
aws --region us-east-1 cloudformation create-stack --stack-name project-pipeline --template-body file:///$DIRECTORY/pipeline.json --capabilities CAPABILITY_IAM --parameters ParameterKey=gitHubToken,ParameterValue=$GITHUB_TOKEN
