#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=${DIRECTORY}/../../lib
CLUSTER=$(basename ${DIRECTORY})

ecs-cli configure --region $(aws configure get region) --cluster ${CLUSTER}
curl -so ${DIRECTORY}/docker-compose.yml https://raw.githubusercontent.com/jumal/aws-continuous-delivery-demo-app/master/docker-compose.yml
ecs-cli compose --file ${DIRECTORY}/docker-compose.yml service rm
rm ${DIRECTORY}/docker-compose.yml
ecs-cli down --force
${LIB}/delete-key-pair.sh ${CLUSTER}
