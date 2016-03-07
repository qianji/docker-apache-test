DOCKER_HUB_REPO_NAME="qianjizheng/docker-apache-test"
docker ps -a | awk '{ print $1,$2 }' | grep $DOCKER_HUB_REPO_NAME | awk '{print $1 }' | xargs -I {} docker stop {}
docker ps -a | awk '{ print $1,$2 }' | grep $DOCKER_HUB_REPO_NAME | awk '{print $1 }' | xargs -I {} docker rm {}
docker pull $DOCKER_HUB_REPO_NAME
docker run -d -p 81:80 $DOCKER_HUB_REPO_NAME
