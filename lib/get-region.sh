#!/bin/bash -ex
echo `cat ~/.aws/config | grep region | cut -d' ' -f3`
