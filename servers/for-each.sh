#!/bin/bash -ex
if [ "$#" -ne 1 ]; then
    echo "Usage: for-each.sh ACTION"
    exit 1
fi
DIRECTORY=$(cd ${0%/*} && echo $PWD)

for server in ${DIRECTORY}/*/; do
    ${server}$1.sh
done
