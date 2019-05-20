#!/bin/bash

docker rm -f $(docker ps -aq)
docker-compose -f ../base/docker-compose-orderer.yaml down --volumes --remove-orphans
rm -rf /tmp/caliper