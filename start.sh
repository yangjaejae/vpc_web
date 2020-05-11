  
#!/bin/bash
DOCKER_CONTAINER_NAME="web"
DOCKER_IMAGE_NAME="web/nodejs"
DOCKER_IMAGE_TAG="v1.0.0"
COMPOSE_FILE=docker-compose.yaml
echo "start WEB Server"

echo "Build image#############################################"
docker rm -f $(docker ps -aqf name="${DOCKER_CONTAINER_NAME}")
docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .
docker run -d \
           -p "8080:8080" \
           --name="web" \
           -v ~/vpc_web/:/usr/src/app \
           -w "/usr/src/app" \
           --restart=on-failure \
           ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} \
           npm start
