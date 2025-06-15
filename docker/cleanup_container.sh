#!/bin/bash

# replace the ^test with any name with container that is running and needs to be stopped and removed
containers=$(docker ps -a --format "{{.Names}}" | grep "^test" || true)

for name in $containers; do
  echo "Stopping container: $name"
  docker stop "$name"
  echo "Removing container: $name"
  docker rm "$name"
done
