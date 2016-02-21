#!/bin/bash

for resource in *
do
    $resource/delete.sh
done