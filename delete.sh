#!/bin/bash
set -e
DIRECTORY=$(cd ${0%/*} && echo $PWD)
$DIRECTORY/servers/delete.sh
$DIRECTORY/pipeline/delete.sh
