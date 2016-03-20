#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
LIB=${DIRECTORY}/../../lib
CLUSTER=$(basename ${DIRECTORY})

${DIRECTORY}/jenkins/create.sh
${DIRECTORY}/sonarqube/create.sh

${LIB}/create-key-pair.sh ${CLUSTER}
ecs-cli configure --region $(aws configure get region) --cluster ${CLUSTER}
ecs-cli up --instance-type t2.medium --keypair ${CLUSTER} --capability-iam
${DIRECTORY}/policies.sh attach
ecs-cli compose --file ${DIRECTORY}/docker-compose.yml service up
${LIB}/open-port.sh ${CLUSTER} 9000
