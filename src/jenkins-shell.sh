#!/bin/bash
PROJECT_NAME="docker-shiny"
SERVICE_NAME=$PROJECT_NAME"-service"
IMAGE_VERSION="v_"${BUILD_NUMBER}
TASK_FAMILY=$PROJECT_NAME
# Create a new task definition for this build
sed -e "s;%BUILD_NUMBER%;${BUILD_NUMBER};g" $PROJECT_NAME.json > $PROJECT_NAME-v_${BUILD_NUMBER}.json
aws ecs register-task-definition --family $PROJECT_NAME --cli-input-json file://$PROJECT_NAME-v_${BUILD_NUMBER}.json

# Update the service with the new task definition and desired count
TASK_REVISION=`aws ecs describe-task-definition --task-definition $PROJECT_NAME | egrep "revision" | tr "/" " " | awk '{print $2}' | sed 's/"$//'`


aws ecs update-service --cluster default --service ${SERVICE_NAME} --task-definition ${TASK_FAMILY}:${TASK_REVISION} --desired-count 1
