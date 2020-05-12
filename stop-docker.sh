#!/bin/bash

## application stop 
pwd
whoami

echo "Remove container#############################################"
docker stop $(docker ps -qa) && docker rm $(docker ps -qa)