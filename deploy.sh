#!/bin/bash

set -x #Enable debugging output

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [[ "$GIT_BRANCH" == 'dev_branch' ]]; then
   echo "Build and deploying code in Development"
   ./build.sh
   docker tag nginximg susidockerrepo/dev:latest
   docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PAT"
   docker push susidockerrepo/dev:latest
elif [[ "$GIT_BRANCH" == 'main' ]]; then
   echo "Build and deploying code in production"
   ./build.sh
   docker tag nginximg susidockerrepo/prod:latest
   docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PAT"
   docker push susidockerrepo/prod:latest
else
   echo "Deployment failed..."
fi
