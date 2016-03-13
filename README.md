# AWS Continuous Delivery Demo
[![License](https://img.shields.io/badge/license-Apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)

Continuous Delivery demo using Amazon Web Services

This demo uses:
 - **Amazon CodePipeline** for orchestration
 - **Docker** for container support
 - **Jenkins** for continuous integration
 - **SonarQube** for static code analysis
 - **Amazon CloudFormation** for provisioning
 - **Amazon ECS & ECR** for EC2 Docker and registries support

Sample pipeline:
 - Automatically **build** on commit, **run unit tests** and perform **static code analysis**
 - Automatically **build and push a docker image** and **deploy to a QA environment**
 - Allow **deployment to the production environment**

![Continuous Delivery Pipeline](https://raw.githubusercontent.com/jumal/aws-continuous-delivery-demo/master/doc/pipeline.jpg)

## Usage
To create the continuous delivery pipeline and servers:
```
./create.sh
```
This will create:
 - The ECR **Docker repositories** for the project, Jenkins and Sonarqube
 - An ECS service for the **build server**
 - A **Jenkins Docker image**
  - Using authentication
  - Having all the required plugins and tools setup
  - Having the Jobs created automatically
 - A **SonarQube Docker image**
  - Using authentication
  - Having all the required plugins setup
 - ECS **clusters** for the **QA and production** environments
 - The CodePipeline **continuous delivery pipeline**

## Prerequisites

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

## Cleanup

To delete all the AWS resources created by this demo:
```
./delete.sh
```
