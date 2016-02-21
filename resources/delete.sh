#!/bin/bash
DIRECTORY=$(cd ${0%/*} && echo $PWD)

for resource in $DIRECTORY/*/; do
    if [ -f ${resource}delete.sh ]; then ${resource}delete.sh; fi
done
