#!/bin/bash

file=${1:-docker-compose.yaml} 

docker-compose -f ${file} up -d
docker-compose logs -f
ipAddress="$(curl ifconfig.me)"

echo "Portainer - http://$ipAddress:9000"
echo "Jenkins — http://$ipAddress:8080"
