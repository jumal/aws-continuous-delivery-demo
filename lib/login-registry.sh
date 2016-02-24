#!/bin/bash
set -e
LOGIN_COMMAND=`aws ecr get-login`
$LOGIN_COMMAND
