#!/bin/bash

DIRECTORY=$(cd ${0%/*} && echo $PWD)
$DIRECTORY/image/create.sh
$DIRECTORY/server/create.sh
