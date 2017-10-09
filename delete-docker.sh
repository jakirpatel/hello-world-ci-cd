#!/bin/bash
# Tag the image with the environment
ENV="production"
ENVTEST="test"
DATE=`date +%Y%m%d`

# Free the space of the disk

# Remove the image
sudo docker rmi $DOCKER_USERNAME/helloworld-$ENV:$DATE$BUILD_NUMBER
sudo docker rmi $DOCKER_USERNAME/helloworld-$ENV:latest

# Remove the test image
sudo docker rmi helloworldtest
