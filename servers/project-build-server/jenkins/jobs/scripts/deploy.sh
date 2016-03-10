#!/bin/bash -ex
if [ "$#" -ne 1 ]; then
    echo "Usage: deploy.sh CLUSTER"
    exit 1
fi
ecs-cli configure --region $(aws configure get region) --cluster $1
ecs-cli compose --project-name $1 service up
