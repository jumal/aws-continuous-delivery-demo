#!/bin/bash

DIRECTORY=$(cd ${0%/*} && echo $PWD)
$DIRECTORY/image/delete.sh
$DIRECTORY/server/delete.sh
