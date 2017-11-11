#!/bin/bash

sudo apt-get update
sudo apt-get -y install unzip lib32stdc++6 lib32z1
cd /tmp/
sudo wget https://downloads.gradle.org/distributions/gradle-3.5.1-all.zip
sudo unzip -d /opt/ gradle-3.5.1-all.zip
echo "export PATH=/opt/gradle-3.5.1/bin:\$PATH" >> ~/.bashrc
echo "Installing Gradle done."
sudo gradle -version

sudo wget https://dl.google.com/android/repository/tools_r25.2.3-linux.zip

mkdir /opt/android-sdk-linux/
sudo unzip -d /opt/android-sdk-linux/ tools_r25.2.3-linux.zip
echo "export PATH=/opt/android-sdk-linux/tools:\$PATH" >> ~/.bashrc
echo "export PATH=/opt/android-sdk-linux/platform-tools:\$PATH" >> ~/.bashrc
echo "export PATH=/opt/android-sdk-linux/tools/bin:\$PATH" >> ~/.bashrc

echo "Installing Android SDK done. now will installing depedencies..."
sudo sdkmanager "platforms;android-25"
sudo sdkmanager "extras;android;m2repository"
sudo sdkmanager "cmake;3.6.4111459"
