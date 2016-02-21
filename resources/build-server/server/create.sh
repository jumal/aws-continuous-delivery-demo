#!/bin/bash

# Create instance profile
aws cloudformation create-stack --stack-name build-server-instance-profile --template-body file://instance-profile.json --capabilities CAPABILITY_IAM

# Create service

#aws iam create-role --role-name ec2-access-codepipeline --assume-role-policy-document file://trust-policy.json
#aws iam attach-role-policy --role-name ec2-access-codepipeline --policy-arn arn:aws:iam::aws:policy/AWSCodePipelineCustomActionAccess
#aws iam create-instance-profile --instance-profile-name ec2-access-codepipeline
#aws iam add-role-to-instance-profile --instance-profile-name ec2-access-codepipeline --role-name ec2-access-codepipeline
#INSTANCE_PROFILE_ARN=`aws iam get-instance-profile --instance-profile-name ec2-access-codepipeline --query "InstanceProfile.Arn" --output text`

