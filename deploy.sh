#!/bin/bash

set -x #Enable debugging output

echo "Current branch: $BRANCH_NAME"

if [ "$BRANCH_NAME" = "dev_branch" ]; then
   echo "Build and deploying code in Development "
   ./build.sh
   docker tag nginximg susidockerrepo/dev:latest
   docker login -u "$DOCKER_USERNAME" --password-stdin <<<"$DOCKER_PAT"
   docker push susidockerrepo/dev:latest
elif [ "$BRANCH_NAME" = "main" ]; then
   echo "Build and deploying code in production "
   ./build.sh
   docker tag nginximg susidockerrepo/prod:latest
   docker login -u "$DOCKER_USERNAME" --password-stdin <<<"$DOCKER_PAT"
   docker push susidockerrepo/prod:latest
else
   echo "Deployment failed..."
fi

