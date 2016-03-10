# AWS Continuous Delivery Demo
[![License](https://img.shields.io/badge/license-Apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)

Continuous delivery demo using Amazon Web Services

This demo uses:
 - **AWS CodePipeline** for orchestration
 - **Docker** for container support
 - **Jenkins** for continuous integration
 - **SonarQube** for static code analysis
 - **AWS CloudFormation** for provisioning
 - **AWS ECS** for Docker support

Sample pipeline:
 - Automatically **build** on commit, **run unit tests** and perform **static code analysis**
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
### Docker
To install Docker, follow the instructions for your OS on [this page](https://docs.docker.com/engine/installation).

### Continuous Delivery Pipeline & Servers
```
./create.sh
```

## Usage

To access AWS CodePipeline, point your browser to [https://console.aws.amazon.com/codepipeline/home?region=us-east-1#/view/Project](https://console.aws.amazon.com/codepipeline/home?region=us-east-1#/view/Project)

## Cleanup
```
./delete.sh
```
