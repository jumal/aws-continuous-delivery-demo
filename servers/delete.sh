#!/bin/bash
set -e
DIRECTORY=$(cd ${0%/*} && echo $PWD)
for server in $DIRECTORY/*/; do
    ${server}delete.sh
done
