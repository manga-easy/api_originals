#!/bin/bash

echo "Setting configs for dev environment"

export POSTGRES_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' originals_postgres)
echo "Copy this IP address and put it into your application.properties"
echo $POSTGRES_IP

# Check if a container with the name "originals_postgres" already exists
if [ "$(docker ps -aq -f name=originals_postgres)" ]; then
    # If the container exists, start it if it's not already running
    if [ ! "$(docker ps -q -f name=originals_postgres)" ]; then
        echo "Starting existing container: originals_postgres"
        docker start originals_postgres
    else
        echo "Container already running: originals_postgres"
    fi
else
    # If the container doesn't exist, create a new one
    echo "Creating new container: originals_postgres"
    docker run --name originals_postgres \
    -e POSTGRES_PASSWORD=originals2023 \
    -e POSTGRES_USER=dev \
    -e POSTGRES_DB=originals \
    -d postgres:15.2-alpine3.17
fi



