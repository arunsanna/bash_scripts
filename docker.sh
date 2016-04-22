
cd
apt-get install apt-get install lxc
apt-get install lxc
lxc-ls --fancy
lxc-create -t ubuntu -n newname
su ubuntu

#installtion soft link for the reference of software with multiple names
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker

#create a new docker environment
sudo docker run -i -t ubuntu /bin/bash 

