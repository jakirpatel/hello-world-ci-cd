#!/bin/bash
# Tag the image with the environment
ENV="production"
ENVTEST="test"
DATE=`date +%Y%m%d`

# Copy the production Dockerfile.production with Dockerfile
cp Dockerfile.production Dockerfile

# Build the Docker Image
sudo docker build -t $DOCKER_USERNAME/helloworld-$ENV:$DATE$BUILD_NUMBER --no-cache --build-arg VERSION=$BUILD_NUMBER .

# Tag the test Image
sudo docker tag $DOCKER_USERNAME/helloworld-$ENV:$DATE$BUILD_NUMBER helloworldtest

# Build the test Dockerfile
sudo docker build -t helloworld-test -f Dockerfile.test --no-cache.

# Run the test
sudo docker run -rm helloworld-test

# Tag the Docker Image
sudo docker tag $DOCKER_USERNAME/helloworld-$ENV:$DATE$BUILD_NUMBER $DOCKER_USERNAME/helloworld-$ENV:latest

# Login to the Docker
sudo docker login -u $DOCKER_USERNAME --password $DOCKER_PASSWORD

# Push to Docker Hub
sudo docker push $DOCKER_USERNAME/helloworld-$ENV:$DATE$BUILD_NUMBER

# the latest tag for this image:
sudo docker push $DOCKER_USERNAME/helloworld-$ENV:latest

#Anchore
echo "$DOCKER_USERNAME/helloworld-$ENV:$DATE$BUILD_NUMBER ${WORKSPACE}/Dockerfile.production" > anchore_images
