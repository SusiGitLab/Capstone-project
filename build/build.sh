#!/bin/bash

#docker build
docker build -t nginximg .

#docker container
docker-compose up -d

