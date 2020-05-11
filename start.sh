  
#!/bin/bash
DOCKER_CONTAINER_NAME="web"
DOCKER_IMAGE_NAME="web/nodejs"
DOCKER_IMAGE_TAG="v1.0.0"
COMPOSE_FILE=docker-compose.yaml
echo "start WEB Server"

function restartContainers() {
  docker rm -f $(docker ps -aqf name="${DOCKER_CONTAINER_NAME}")
  docker-compose -f ${COMPOSE_FILE} up -d 2>&1
}

function rebuildDocker() {
    echo "Stop and Remove current WEB Server docker container..."
    docker rm -f $(docker ps -aqf name="${DOCKER_CONTAINER_NAME}")

    if [[ "$(docker images -q ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} 2> /dev/null)" != "" ]]; then
        echo "Remove WEB Server docker IMAGE!!.."
        docker rmi -f ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}
    fi

    echo "Build WEB Server image.."
    docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .
    docker-compose -f ${COMPOSE_FILE} up -d 2>&1
}


function askProceed () {
  read -p "Remove CA-Registry Server images and container to rebuild those items(Y) or just restart container(N) ? [Y/N] " ans
  case "$ans" in
    y|Y|"" )
      echo "Remove and rebuild docker container of WEB Server"
      rebuildDocker
    ;;
    n|N )
      echo "Restart docker container of WEB Server..."
      restartContainers
    ;;
    * )
      echo "invalid response"
      askProceed
    ;;
  esac
}


askProceed