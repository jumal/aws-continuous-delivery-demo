#!/bin/bash -e
DIRECTORY=$(cd ${0%/*} && echo $PWD)
$DIRECTORY/servers/for-each.sh create
$DIRECTORY/pipeline/create.sh
