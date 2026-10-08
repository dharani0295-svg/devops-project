#!/bin/bash

set -e

echo "Pulling latest code..."
git pull origin main

echo "Building Docker image..."
docker build -t devops-web-app .

echo "Stopping old container..."
docker stop devops-web-app-container || true

echo "Removing old container..."
docker rm devops-web-app-container || true

echo "Starting new container..."
docker run -d -p 80:80 --name devops-web-app-container devops-web-app

echo "Deployment completed successfully!"
