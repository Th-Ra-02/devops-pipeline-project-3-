#!/bin/bash
USERNAME="thra21"
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$BRANCH" = "main" ]; then
  REPO="$USERNAME/prod"
else
  REPO="$USERNAME/dev"
fi
docker build -t $REPO:latest .
docker push $REPO:latest

