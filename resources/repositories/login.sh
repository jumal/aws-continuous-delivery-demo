#!/bin/bash

LOGIN_COMMAND=`aws ecr get-login`
$LOGIN_COMMAND
