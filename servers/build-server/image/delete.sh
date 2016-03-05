#!/bin/bash -ex
aws --region us-east-1 ecr delete-repository --repository-name build-server --force
