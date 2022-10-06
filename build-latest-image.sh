#!/bin/bash

#
# This script creates a docker image
# - The docker image name is based on the current folder name
#

source ./vars.sh

echo "Creating image [${IMAGE_NAME}]"

#
# 2. Build docker image
#
docker build --tag "${IMAGE_NAME}" --file "Dockerfile" .

# Force a pull of the "FROM" image
# docker build --pull --tag "${IMAGE_NAME}" --file "Dockerfile" .
