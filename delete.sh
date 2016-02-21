#!/bin/bash
DIRECTORY=$(cd ${0%/*} && echo $PWD)

$DIRECTORY/resources/delete.sh
$DIRECTORY/pipeline/delete.sh
