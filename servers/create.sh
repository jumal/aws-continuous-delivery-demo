#!/bin/bash
set -e
DIRECTORY=$(cd ${0%/*} && echo $PWD)
$DIRECTORY/../lib/registry-login.sh
for server in $DIRECTORY/*/; do
    ${server}create.sh
done
