#!/bin/bash

## application stop 
pwd
whoami

cd /home/ec2-user/vpc_web
rm -rf ./*

echo "Remove container#############################################"
docker stop $(docker ps -qa) && docker rm $(docker ps -qa)