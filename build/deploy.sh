GIT_BRANH=git rev-parse --abbrev-ref HEAD
   if[[$GIT_BRANCH==dev]]
   ./build.sh
   Docker tag nginximg dockerrpo/dev:latest
   Docker login command
   Docker push
   elsif[[$GIT_BRANCH==prod]]
   ./build.sh
   Docker tag nginximg dockerrpo/prod:latest
   Docker login command
   Docker push
   Else
   Echo “Deployment failed”

