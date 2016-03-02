#!/bin/bash -ex
if [ "$#" -ne 1 ]; then
    echo "Usage: delete-key-pair.sh NAME"
    exit 1
fi
aws ec2 delete-key-pair --key-name $1
rm -f ~/.ssh/$1.pem
