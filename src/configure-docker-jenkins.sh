# We’ll be using Jenkins to build our Docker images, so we need to add the jenkins user to the docker group.
sudo usermod -a -G docker jenkins

# start docker, jenkins and make sure they will be running after a reboot
sudo service jenkins start
sudo service docker start
