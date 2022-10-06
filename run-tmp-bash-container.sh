#!/bin/bash

#
# This script runs a temporarily docker container
# - Intented use: debugging and building images
# - The command shell bash will be used as docker command
#   (instead of the default container command)
# - The container will be removed when bash exits
#

source ./vars.sh

echo "Running bash container using image [${IMAGE_NAME}]"

cmd=("docker" "run" "-ti" "--rm" "${IMAGE_NAME}" "/bin/bash")

echo "${cmd[@]}"
"${cmd[@]}"
