#! /bin/bash
docker ps -a
read -p $'----------------------------------------------\n' container
if [[ -n "${container}" ]]; then
    echo "[$container]"

    docker stop "$container"
    docker rm "$container"
else
    echo "No container selected"
fi
