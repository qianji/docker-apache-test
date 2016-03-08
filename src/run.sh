sudo yum install -y wget git java vim
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install -y jenkins
sudo usermod -a -G docker jenkins
#sudo service docker start
sudo service jenkins start
sudo chkconfig jenkins on
sudo curl -O https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo /usr/local/bin/pip install awscli
sudo ln -s /usr/local/bin/aws /usr/bin/aws

