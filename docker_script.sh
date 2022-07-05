#!/bin/bash

#Author: Caroline

# Date:July 2022

## Docker installation on Ubuntu

## Cleaning up the systemCleaning up the system

echo "Welcome to Docker installation on Ubuntu server. Please wait ...."
sleep 4

sudo apt-get remove docker docker-engine docker.io containerd runc

# Setting up the docker repository
sudo apt-get update
sudo apt-get -y install ca-certificates curl gnupg lsb-release
if [ $? -ne 0 ]
then
echo "Docker installation failed. Please check the error message and troubleshoot."
exit 1
fi

sleep 4

# Adding Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
if [ $? -ne 0 ]
then
echo "Docker Docker’s official GPG key was not added. Please check the error message."
exit 2
fi
sleep 4

# Setting up the repository
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  if [ $? -ne 0 ]
then
echo "Set up failed. Please check the error message."
exit 3
fi

# Install Docker Engine
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
if [ $? -ne 0 ]
then
echo "Docker installation failed. Please check the error message."
exit 4
fsleep 4

# Verify that Docker Engine is installed correctly

echo "Verifyung if Docker was installed succesfully. Check below your Welcome message."

sleep 4

sudo docker run hello-world



