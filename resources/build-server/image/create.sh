#!/bin/bash

docker build -t jumal/jenkins .

docker login -u $FF -p $ffff server:port
docker push jumal/jenkins
