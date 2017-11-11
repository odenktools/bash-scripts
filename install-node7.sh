#!/bin/bash

sudo apt-get install curl
curl --silent --location https://deb.nodesource.com/setup_7.x | sudo bash -
sudo apt-get -y install nodejs
ln -s /usr/bin/nodejs /user/bin/node
# Add node_modules to environment variables
echo "export NODE_PATH=/usr/local/lib/node_modules" >> ~/.bashrc
