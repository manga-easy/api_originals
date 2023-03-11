#!/bin/bash

echo "Setting configs for dev environment"  && \

docker run --name originals_postgres \
-e POSTGRES_PASSWORD=originals2023 \
-e POSTGRES_USER=dev \
-e POSTGRES_DB=originals \
-d postgres:15.2-alpine3.17



