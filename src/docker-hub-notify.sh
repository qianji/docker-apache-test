#!/bin/bash
SERVICE_NAME="docker-apache-service"
DOCKER_HUB_REPO_NAME="qianjizheng/docker-apache-test"
docker ps -a | awk '{ print $1,$2 }' | grep $DOCKER_HUB_REPO_NAME | awk '{print $1 }' | xargs -I {} docker stop {}
docker ps -a | awk '{ print $1,$2 }' | grep $DOCKER_HUB_REPO_NAME | awk '{print $1 }' | xargs -I {} docker rm {}
aws ecs update-service --cluster default --service ${SERVICE_NAME} --desired-count 0
docker pull $DOCKER_HUB_REPO_NAME
#docker run -d -p 81:80 $DOCKER_HUB_REPO_NAME
#exit

SERVICE_NAME="docker-apache-service"

# Create a new task definition for this build

aws ecs update-service --cluster default --service ${SERVICE_NAME} --desired-count 1
