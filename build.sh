#!/bin/sh

REPO=nothingdocker
#IMAGE_NAME=`basename $PWD`
IMAGE_NAME=elk-beat
TAG=${1:-latest}
echo $IMAGE_NAME:$TAG
docker build -t $REPO/$IMAGE_NAME:$TAG .
#docker push $REPO/$IMAGE_NAME:$TAG
