#!/bin/bash -ex
$(aws --region us-east-1 ecr get-login)
aws --region us-east-1 ecr delete-repository --repository-name project-build-server --force
aws --region us-east-1 ecr delete-repository --repository-name project --force
