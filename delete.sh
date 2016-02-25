#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
$DIRECTORY/pipeline/delete.sh
$DIRECTORY/servers/for-each.sh delete
