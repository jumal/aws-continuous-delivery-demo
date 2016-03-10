#!/bin/bash -ex
$(aws --region us-east-1 ecr get-login)
aws --region us-east-1 ecr create-repository --repository-name project-jenkins
aws --region us-east-1 ecr create-repository --repository-name project-sonarqube
aws --region us-east-1 ecr create-repository --repository-name project
