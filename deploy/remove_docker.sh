#!/bin/bash

## application stop 
docker stop $(docker ps -qa) && docker rm $(docker ps -qa)