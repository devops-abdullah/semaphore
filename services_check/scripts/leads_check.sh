#!/bin/bash
DIR=`docker inspect nginx --format='{{index .Config.Labels "com.docker.compose.project.working_dir"}}'`CONTAINER_NAME="leads"
PORT="60007"

# Check if the port is listening
nc -z localhost $PORT

if [ $? -ne 0 ]; then
    echo "Port $PORT is not listening. Restarting container $CONTAINER_NAME..."
    cd $DIR && docker compose up -d --force-recreate $CONTAINER_NAME || docker-compose up -d --force-recreate $CONTAINER_NAME
else
    echo "Port $PORT is listening."
fi