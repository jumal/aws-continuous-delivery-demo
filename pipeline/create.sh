#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=${DIRECTORY}/../lib
GITHUB_TOKEN=$(cat ${DIRECTORY}/github-token.oauth)
BUILD_SERVER_URL=http://$(${LIB}/get-ip.sh project-build-server)

set +e
aws --region us-east-1 cloudformation create-stack --stack-name pipeline-action-types --template-body file:///${DIRECTORY}/action-types.json
set -e
aws --region us-east-1 cloudformation create-stack --stack-name project-pipeline --template-body file:///${DIRECTORY}/pipeline.json --capabilities CAPABILITY_IAM --parameters ParameterKey=gitHubToken,ParameterValue=${GITHUB_TOKEN} ParameterKey=buildServerURL,ParameterValue=${BUILD_SERVER_URL}
