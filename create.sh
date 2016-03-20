#!/bin/bash -ex
DIRECTORY=$(cd ${0%/*} && echo $PWD)
${DIRECTORY}/repositories/create.sh
${DIRECTORY}/servers/for-each.sh create
${DIRECTORY}/pipeline/create.sh
