#!/bin/bash

file=${1:-docker-compose.yaml} 

docker-compose -f ${file} up -d
docker-compose logs -f
ipAddress="$(dig @resolver1.opendns.com ANY myip.opendns.com +short)"

echo ""
echo "Jenkins — http://$ipAddress:8080"
echo "SonarQube — http://$ipAddress:9000"
echo "GitLab — http://$ipAddress:10080"
echo "Gerrit — http://$ipAddress:8070"
echo "Portainer - http://$ipAddress:9000"
echo "Jenkins Initial Password - "
cat /var/lib/docker/volumes/ddi_cbcd_jenkins-volume/_data/secrets/initialAdminPassword

  
  
  
  
  
