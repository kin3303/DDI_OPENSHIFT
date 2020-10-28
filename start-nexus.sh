#!/bin/bash

file=${1:-docker-compose-nexus.yaml} 

docker-compose -f ${file} up -d
docker-compose logs -f
ipAddress="$(dig @resolver1.opendns.com ANY myip.opendns.com +short)"

echo "Portainer - http://$ipAddress:9000"
echo "Nexus — https://$ipAddress"
