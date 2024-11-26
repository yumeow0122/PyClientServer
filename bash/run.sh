#!/bin/bash

source .env

CURRENT_DIR=$(pwd)

docker run --gpus all -it \
  -v $CURRENT_DIR:/workspace \
  -w /workspace \
  $IMAGE_NAME \
  bash
