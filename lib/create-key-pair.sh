#!/bin/bash -ex
if [ "$#" -ne 1 ]; then
    echo "Usage: create-key-pair.sh NAME"
    exit 1
fi
aws ec2 create-key-pair --key-name $1 --query 'KeyMaterial' --output text > ~/.ssh/$1.pem
chmod 400 ~/.ssh/$1.pem
