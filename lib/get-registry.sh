#!/bin/bash -e
echo $(echo $(aws --region us-east-1 ecr get-login) | awk '{print $9}' | sed 's/^https:\/\///g')
