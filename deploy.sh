#!/bin/bash
USERNAME="thra21"
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$BRANCH" = "main" ]; then
  REPO="$USERNAME/prod"
else
  REPO="$USERNAME/dev"
fi
docker pull $REPO:latest
docker stop app || true
docker rm app || true
docker run -d --name app -p 80:80 --restart always $REPO:latest
echo "App deployed from $REPO"

