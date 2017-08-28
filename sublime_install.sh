#!bin/bash

echo adding the repo of the sublime
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

echo installing the sublime
sudo apt-get update
sudo apt-get install sublime-text-installer
sudo apt-get install -y git
sudo apt-get install -y awscli

echo cleanup installtion temp files
sudo apt-get autoremove
sudo apt-get autoclean
