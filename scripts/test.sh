#!/bin/sh

sudo ros -v
sudo ros os list
sudo ros os version
sudo ros service list
sudo ros service enable kernel-headers
sudo system-docker run -d nginx
sudo system-docker ps
sudo ros config export 
docker run -d nginx
docker ps
sudo ros config set rancher.console ubuntu
sudo ros config get rancher.console
sudo ros console list
sudo ros engine list
sudo ros console switch -f ubuntu
