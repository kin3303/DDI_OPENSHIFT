#!/bin/bash

file=${1:-docker-compose.yaml} 

docker-compose -f ${file} up -d
docker-compose logs -f
ipAddress="$(dig @resolver1.opendns.com ANY myip.opendns.com +short)"

echo "Portainer - http://$ipAddress:9000"
echo "Jenkins — http://$ipAddress:8080"
echo "SonarQube — http://$ipAddress:9000"
echo "Nexus — http://$ipAddress:8081"
