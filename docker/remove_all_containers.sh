#!/bin/bash
docker ps -aq | xargs -r docker stop && docker ps -aq | xargs -r docker rm
