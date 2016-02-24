#!/bin/bash
set -e
aws ecr delete-repository --repository-name build-server --force

