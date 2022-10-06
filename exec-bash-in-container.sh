#!/bin/bash

#
# This script runs a temporarily docker container
# - Intented use: debugging and building images
# - The command shell bash will be used as docker command (instead of the default container command)
# - The container will be removed when bash exits
#

source ./vars.sh

echo "Running bash in existing container [${CONTAINER_NAME}]"

cmd=("docker" "exec" "-ti" "${CONTAINER_NAME}" "/bin/bash")

echo "${cmd[@]}"
"${cmd[@]}"
