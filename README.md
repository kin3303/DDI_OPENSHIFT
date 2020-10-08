# Openshift 와 Cloudbees CD 를 연동하기 위한 프로젝트

- 사전 준비사항 
  - Jenkins 설치 및 Jenkins 에 docker plugin 설치
  - oc client 를 설치
 
## Step 1 : 준비사항

1. 기존 프로젝트의 Deployment, Service, Route 정보를 Template 으로 제작 => deploy-template.yaml
2. my-dev, my-prod 프로젝트를 생성
3. Cloudbees CD 에 두 개의 Configuration 을 생성
```console
$ cat > cloudbeesCD-Config-Generator.sh <<EOF
#!/bin/bash

export projectName=$1
export serviceAccount=$2

oc create -n $projectName serviceaccount $serviceAccount
oc adm policy add-cluster-role-to-user edit system:serviceaccount:$projectName:$serviceAccount
oc adm policy add-cluster-role-to-user cluster-reader system:serviceaccount:$projectName:$serviceAccount
secretName=`oc describe  -n $projectName serviceaccount $serviceAccount | grep Tokens:|awk '{print $2}'`
TOKEN=$(oc get secret -n $projectName $secretName -o jsonpath='{.data.token}' | base64 -d)
APISERVER=$(kubectl config view | grep server | cut -f 2- -d ":" | tr -d " ")

echo -e "Openshift API Endpoint: \n$APISERVER\n"
echo -e "Openshift ProjectName : $projectName\n"
echo -e "Service Account : $serviceAccount\n"
echo -e "Bearer token: \n$TOKEN\n"
EOF
$ chmod +x cloudbeesCD-Config-Generator.sh


$ oc login https://test.letsgohomenow.com:8443 --token=jKRtoHa4RtdJzYKTgYqhv4e2Vems4pouN4Xqt8_SXXg
$ oc new-project my-dev
$ oc new-project my-prod
$ ./cloudbeesCD-Config-Generator.sh my-dev my-dev-sa
$ ./cloudbeesCD-Config-Generator.sh my-prod my-prod-sa 
```
