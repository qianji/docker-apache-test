# getting updates
sudo apt-get update
sudo apt-get dist-upgrade -y

# install apache2 and php5
sudo apt-get install apache2 -y
sudo a2enmod rewrite
sudo /etc/init.d/apache2 restart
sudo apt-get install libapache2-mod-php5 -y
sudo chown -R www-data:www-data /var/www
sudo chmod -R g+rw /var/www

#configure to make index.php as default
sudo sed -i "/DirectoryIndex/ s/DirectoryIndex /DirectoryIndex index.php /" /etc/apache2/mods-enabled/dir.conf

sudo /etc/init.d/apache2 restart


# instll docker on ubuntu
# Ask for the user password
# Script only works if sudo caches the password for a few minutes
sudo true

# Install kernel extra's to enable docker aufs support
sudo apt-get -y install linux-image-extra-$(uname -r)

# Add Docker PPA and install latest version
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get install lxc-docker -y

# Alternatively you can use the official docker install script
# wget -qO- https://get.docker.com/ | sh

# Install docker-compose
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/1.6.2/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

# Install docker-cleanup command
cd /tmp
git clone https://gist.github.com/76b450a0c986e576e98b.git
cd 76b450a0c986e576e98b
sudo mv docker-cleanup /usr/local/bin/docker-cleanup
sudo chmod +x /usr/local/bin/docker-cleanup
