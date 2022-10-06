#!/bin/bash

FOLDER_NAME=$(basename $PWD)

if [ -z "${FOLDER_NAME}" ] || [ "." == "${FOLDER_NAME}" ]; then
  echo "Failed to detect folder name"
  exit
fi

IMAGE_NAME="${FOLDER_NAME}:latest"
APP_BASE_NAME="${FOLDER_NAME}"

CONTAINER_NAME=${FOLDER_NAME}

# echo $APP_BASE_NAME
