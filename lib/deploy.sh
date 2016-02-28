#!/bin/bash -ex
if [ "$#" -ne 2 ]; then
    echo "Usage: deploy.sh SERVER TAG"
    exit 1
fi
DIRECTORY=$(cd ${0%/*} && echo $PWD)

$($$DIRECTORY/aws-ecr.sh get-login)
docker push $($DIRECTORY/get-registry.sh)/$1:$2
ecs-cli compose --file $DIRECTORY/$1/docker-compose.yml create
REVISION=`aws ecs describe-task-definition --task-definition ecscompose-$1 --query "taskDefinition.revision"`
aws ecs update-service --cluster $1 --service ecscompose-service-$1 --task-definition ecscompose-$1:$REVISION

# Push image to Amazon ECR
#sudo docker push $AWS_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/ci_memes:$TDDIUM_SESSION_ID
# Create new task definition from template file
#sed -e "s;%TDDIUM_SESSION_ID%;$TDDIUM_SESSION_ID;g" ci_memes.json \
#  | sed -e "s;%AWS_ACCOUNT_ID%;$AWS_ACCOUNT_ID;g" \
#  > ci_memes-${TDDIUM_SESSION_ID}.json
# Register updated task
#aws ecs register-task-definition --family ci_memes --cli-input-json file://ci_memes-${TDDIUM_SESSION_ID}.json
# Get revision number of newly created task definition
#REV=`aws ecs describe-task-definition --task-definition ci_memes | jq '.taskDefinition.revision'`
# Update Amazon ECS service to use the new task definition
#aws ecs update-service --cluster default --service ci_memes_service --task-definition ci_memes:${REV}
