# AWS Continuous Delivery Demo
[![License](https://img.shields.io/badge/license-Apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)

Continuous delivery demo using Amazon Web Services

This demo uses:
 - **AWS CodePipeline** for orchestration
 - **Docker** for immutable infrastructure support
 - **Jenkins** for continuous integration
 - **AWS CloudFormation** for provisioning
 - **AWS CodeDeploy** for deployments
 - **AWS ECS** for Docker support

Sample pipeline:
 - Automatically **build** on commit and **run unit tests**
 - Automatically **deploy to QA environment**
 - Allow to **deploy to production environment**

## Setup

The setup is performed using Amazon command line tools to ensure full reproducibility.

### Amazon Command Line Tools

#### AWS CLI

To install AWS CLI, follow the instructions for your OS on [this page](http://aws.amazon.com/cli).

On MacOs:
```
brew install awscli
```
To configure AWS CLI:
```
aws configure
```
Use `json` as default output format

#### Amazon ECS CLI

To install Amazon ECS CLI, follow the instructions for your OS on [this page](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_CLI_installation.html).

On MacOs:
```
sudo curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-darwin-amd64-latest
sudo chmod +x /usr/local/bin/ecs-cli
```

### Continuous Delivery Pipeline & Servers
```
./create.sh
```

## Usage

To access AWS CodePipeline, point your browser to *Work in progress*

## Cleanup
```
./delete.sh
```
