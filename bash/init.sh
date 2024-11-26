#!/bin/bash

if [ ! -f .env ]; then
  echo ".env does not exist. Creating .env from .env.example..."
  if [ -f .env.example ]; then
    cp .env.example .env
    echo ".env created successfully."
  else
    echo ".env.example not found. Please provide a valid .env.example file."
    exit 1
  fi
else
  echo ".env already exists. Skipping creation."
fi

source .env

if docker images | grep -q $IMAGE_NAME; then
  echo "Image already exists: $IMAGE_NAME"
  exit 0
fi

echo "Starting build with image name: $IMAGE_NAME"
docker build -t $IMAGE_NAME .

if [ $? -eq 0 ]; then
  echo "Docker Image build successfully completed."
else
  echo "Docker Image build failed."
  exit 1
fi
