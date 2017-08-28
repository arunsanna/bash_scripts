#!bin/bash
#run the vagrant shell script before running vagrant
sudo apt-get install -y vagrant
sudo apt-get install -y virtualbox-dkms
echo Installed vagrant successfully 
vagrant --version