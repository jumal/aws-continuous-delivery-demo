#!/bin/bash -ex
LIB=../seed/scripts
#REGISTRY=`$LIB/get-registry.sh`

docker build -t project .
#docker tag project:$GIT_COMMIT $REGISTRY/project:$GIT_COMMIT
#$(aws --region us-east-1 ecr get-login)
#docker push $REGISTRY/project:$GIT_COMMIT

#$LIB/deploy.sh project-qa
