#!/bin/bash

sudo apt-get update
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -y -q update
sudo apt-get -y -q install software-properties-common
sudo apt-get -y -q install build-essential
sudo apt-get -y -q install tcl8.5

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -y -q install oracle-java8-installer
sudo update-java-alternatives -s java-8-oracle
