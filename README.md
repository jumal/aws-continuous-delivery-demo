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
 - Automatically build and **push a docker image** and **deploy to a QA environment**
 - Allow **deployment to the production environment**

![Continuous Delivery Pipeline](https://raw.githubusercontent.com/jumal/aws-continuous-delivery-demo/master/doc/pipeline.jpg)

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
To create the continuous delivery pipeline and servers:
```
./create.sh
```
This will create:
 - The AWS ECR **Docker repositories** for the project, Jenkins and Sonarqube
 - An AWS ECS service for the **Build Server**
 - A **Jenkins Docker image**
  - Using **authentication**
  - Having all the required **plugins and tools setup**
  - Having the **Jobs created automatically** 
 - A **SonarQube Docker image**
  - Using **authentication**
  - Having all the required **plugins setup**
 - AWS ECS **Clusters** for the **QA and Production** environments
 - The AWS CodePipeline **continuous delivery pipeline**

![AWS ECS](https://raw.githubusercontent.com/jumal/aws-continuous-delivery-demo/master/doc/ecs.jpg)

## Usage

To access the created continuous delivery pipeline, point your browser to 

[https://console.aws.amazon.com/codepipeline/home?region=us-east-1#/view/Project](https://console.aws.amazon.com/codepipeline/home?region=us-east-1#/view/Project)

## Cleanup
```
./delete.sh
```
