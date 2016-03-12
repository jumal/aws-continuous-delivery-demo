#!/bin/bash -ex
if [ "$#" -ne 1 ]; then
    echo "Usage: deploy.sh CLUSTER"
    exit 1
fi
REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | awk -F\" '/region/ {print $4}')
ecs-cli configure --region $REGION --cluster $1
ecs-cli compose --project-name $1 service up
