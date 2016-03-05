#!/bin/bash -ex
BUCKET=$(aws --region us-east-1 cloudformation describe-stack-resource --stack-name project-pipeline --logical-resource-id artifactStore --output text --query 'StackResourceDetail.PhysicalResourceId')
aws s3 rm s3://$BUCKET --recursive
aws --region us-east-1 cloudformation delete-stack --stack-name project-pipeline
