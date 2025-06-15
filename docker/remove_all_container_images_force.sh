#!/bin/bash
docker ps -aq | xargs -r docker stop && docker ps -aq | xargs -r docker rm && docker images -q | xargs -r docker rmi -f
