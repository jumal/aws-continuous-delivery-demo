# AWS Continuous Delivery Demo

Continuous delivery demo using Amazon Web Services
 - Automatically **build** on commit and **run unit tests**
 - Automatically **deploy** and **run integration tests**
 - Automatically **deploy to QA environment**
 - Allow to **deploy** and **perform load testing**
 - Automatically **deploy to staging environment**
 - Allow to **deploy to production environment**

This demo uses
 - **AWS CodePipeline** for orchestration
 - **GitHub** for source version control 
 - **Docker** for immutable infrastructure support
 - **Jenkins** for continuous integration
 - **AWS CloudFormation** for provisioning
 - **AWS CodeDeploy** for deployments
 - **AWS ECS** for Docker support

## Setup

### AWS CLI

#### Install

Follow the instructions for your OS on [this page](http://aws.amazon.com/cli).

On MacOs:
```
brew install awscli
```

#### Configure
```
aws configure
```
Use `us-east-1`, `us-west-1` or `us-west-2` as default region (other regions are not yet supported)

Use `json` as default output format

### Amazon ECS CLI

#### Install

Follow the instructions for your OS on [this page](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_CLI_installation.html).

On MacOs:
```
sudo curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-darwin-amd64-latest
sudo chmod +x /usr/local/bin/ecs-cli
```

#### Configure
```
ecs-cli configure --region *region*
```
Use the `us-east-1`, `us-west-1` or `us-west-2` as region (other regions are not yet supported)

## Usage
```
./create.sh
```
## Cleanup
```
./delete.sh
```

*Work in progress*
