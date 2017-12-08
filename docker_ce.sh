#!/bin/bash
set +x
apt-get purge -y docker docker-ce docker-engine docker.io
apt-get autoremove -y
apt-get update 
#to aufs storage
apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce
usermod -aG docker $USER
usermod -aG docker ubuntu
cd ~
mkdir confluance-docker
cd confluance-docker
bash /vagrant/docker_confluance.sh 