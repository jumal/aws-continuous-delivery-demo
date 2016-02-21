#!/bin/bash
DIRECTORY=$(cd ${0%/*} && echo $PWD)

$DIRECTORY/resources/create.sh
$DIRECTORY/pipeline/create.sh
