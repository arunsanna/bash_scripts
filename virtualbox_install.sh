#!bin/bash
sudo echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list
wget http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc
sudo apt-key add oracle_vbox.asc
sudo apt-get update
sudo apt-get install virtualbox-5.0
echo " installtion of virtualbox is complete now you can use the virtualbox from your terminal to launch virtualbox version-5"