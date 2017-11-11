#!/bin/bash

#SETUP VARIABLES
activatorVersion="1.3.10"
sbtVersion="0.13.15"

cd /tmp/

echo "Downloading SBT..."
wget http://dl.bintray.com/sbt/debian/sbt-$sbtVersion.deb
sudo dpkg -i sbt-$sbtVersion.deb
sudo apt-get update
sudo apt-get install sbt
rm sbt-$sbtVersion.deb
echo "SBT done."
# Use node as default JavaScript Engine
echo "export SBT_OPTS=\"\$SBT_OPTS -Dsbt.jse.engineType=Node\"" >> ~/.bashrc

echo "Downloading Scala..."
sudo apt-get -y install scala

echo "Downloading Typesafe Activator..."
wget http://downloads.typesafe.com/typesafe-activator/$activatorVersion/typesafe-activator-$activatorVersion.zip
mkdir /opt/activator/ && unzip -d /opt/activator/ typesafe-activator-$activatorVersion.zip
rm typesafe-activator-$activatorVersion.zip
echo "Typesafe Activator done."
# Add activator to environment variables
echo "export PATH=/opt/activator/activator-dist-$activatorVersion/bin:\$PATH" >> ~/.bashrc

#########################
# Reset bash
#########################
source ~/.bashrc
