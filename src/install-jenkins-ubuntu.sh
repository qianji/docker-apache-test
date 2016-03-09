# install jenkins
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins
# We’ll be using Jenkins to build our Docker images, so we need to add the jenkins user to the docker group.
sudo usermod -a -G docker jenkins

# start docker, jenkins and make sure they will be running after a reboot
sudo service jenkins start
sudo chkconfig jenkins on
