#!/bin/bash
DOCKER_CONTAINER_NAME="web"
DOCKER_IMAGE_NAME="web/nodejs"
DOCKER_IMAGE_TAG="v1.0.0"
echo "start WEB Server"

echo "Start container#############################################"
docker run -d \
           -p "8080:8080" \
           --name="${DOCKER_CONTAINER_NAME}" \
           -v /home/ec2-user/vpc_web/:/usr/src/app \
           -w "/usr/src/app" \
           --restart=on-failure \
           ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} \
           bash -c "npm install && npm start"