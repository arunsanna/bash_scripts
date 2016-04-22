#!bin/bash
sudo apt-get update
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk
sudo apt-get install -y openjdk-7-jre
sudo apt-get install -y openjdk-7-jdk
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
echo cleanup installtion temp files

sudo apt-get autoremove
sudo apt-get autoclean
echo installed version of java is && java -version
echo use '"sudo update-alternatives --config java"' to config java environement 