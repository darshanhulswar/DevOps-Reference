#!/bin/bash
docker images -q | xargs -r docker rmi -f
