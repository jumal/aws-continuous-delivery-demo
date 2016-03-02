#!/bin/bash -ex
if [ "$#" -ne 1 ]; then
    echo "Usage: get-ip.sh SERVER"
    exit 1
fi
INSTANCE_ID=` aws ecs list-container-instances --cluster $1 --query "containerInstanceArns" --output text | xargs aws ecs describe-container-instances --cluster $1 --query "containerInstances[].ec2InstanceId" --output text --container-instances`
echo `aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[].Instances[].PublicIpAddress" --output text`