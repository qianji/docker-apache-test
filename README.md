# docker-apache-test
This is a project to build a pipeline with docker, jenkins and AWS ECS/EC2 using apache server. You can extend the project to use other server such as tomcat or shiny-server. The work flow can be described as follows:
- A github project/app contains a Dockerfile and a src folder, where the content of the src folder is used in Dockerfile.
- The programming commit a change in github, for example, change the content in index.php in a apache server.
- Docker hub catches the commit and re-build the docker image.
- After the docker image is rebuilt, docker hub sends a signal to jenkins server.
- Upon receiving a new build from docker hub, jenkins execute shell command in EC2 to pull the new image from docker hub and restart the running app.
