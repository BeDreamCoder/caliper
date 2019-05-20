#!/bin/bash

docker-compose -f ../base/docker-compose-orderer.yaml down --volumes --remove-orphans
docker rm $(docker ps -aq)
rm -rf /tmp/caliper