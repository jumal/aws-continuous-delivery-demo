#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=${DIRECTORY}/../../lib
CLUSTER=$(basename ${DIRECTORY})

${DIRECTORY}/policies.sh detach
ecs-cli configure --region $(aws configure get region) --cluster ${CLUSTER}
ecs-cli compose --file ${DIRECTORY}/docker-compose.yml service rm
ecs-cli down --force
${LIB}/delete-key-pair.sh ${CLUSTER}
