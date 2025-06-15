#!/bin/bash
read -p "Enter Docker container ID or name: " cid && docker stop "$cid" && docker rm "$cid"
