#!/bin/bash
set -e
echo `cat ~/.aws/config | grep region | cut -d' ' -f3`
