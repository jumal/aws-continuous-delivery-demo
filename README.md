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

The setup is performed using AWS CLI to ensure full reproducibility

### Create an IAM User

Create an IAM user having the `AWSCodePipelineFullAccess` managed policy.

### Install and Configure AWS CLI

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


*Work in progress*

## Usage

*Work in progress*
