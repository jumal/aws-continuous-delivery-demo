#!/bin/bash
DIRECTORY=$(cd ${0%/*} && echo $PWD)

# Create instance profile
aws cloudformation create-stack --stack-name build-server-instance-profile --template-body file://$DIRECTORY/instance-profile.json --capabilities CAPABILITY_IAM

# Create service
ecs-cli up  --instance-type t2.micro --size 1 --keypair jumal --capability-iam
ecs-cli compose service up
