#!/bin/bash
DIRECTORY=$(cd ${0%/*} && echo $PWD)

$DIRECTORY/repositories/login.sh
for resource in $DIRECTORY/*/; do
    if [ -f ${resource}create.sh ]; then ${resource}create.sh; fi
done
