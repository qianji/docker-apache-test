sudo yum install -y wget nginx git java
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install -y jenkins
sudo usermod -a -G docker jenkins
sudo service docker start
sudo service jenkins start
sudo service nginx start
sudo chkconfig docker on
sudo chkconfig jenkins on
sudo chkconfig nginx on
sudo curl -O https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo /usr/local/bin/pip install awscli
sudo ln -s /usr/local/bin/aws /usr/bin/aws

