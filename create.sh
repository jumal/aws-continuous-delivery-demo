#!/bin/bash
set -e
DIRECTORY=$(cd ${0%/*} && echo $PWD)
$DIRECTORY/servers/create.sh
$DIRECTORY/pipeline/create.sh
