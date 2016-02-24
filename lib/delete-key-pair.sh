#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: delete-key-pair.sh NAME"
    exit 1
fi
set -e
aws ec2 delete-key-pair --key-name $1
rm ~/.ssh/$1.pem
