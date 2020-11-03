
## Step 1. SA 계정의 Secret 을 얻어 Endpoint, Access Token 얻어내기

```console


# 로그인
$ oc login -u system:admin
...

$ oc get users
NAME        UID                                    FULL NAME   IDENTITIES
admin       307ba95f-cfc8-11ea-9bee-42010a800006               anypassword:admin
daeung      418125c6-cfc8-11ea-9bee-42010a800006               anypassword:daeung
developer   1070d1ca-cfbc-11ea-9bee-42010a800006               anypassword:developer

$ oc adm policy add-cluster-role-to-user cluster-admin daeung
cluster role "cluster-admin" added: "daeung"

$ oc login -u daeung
..

# oc delete project my-prod  
# oc delete project my-dev
$ oc new-project my-prod --description="my-prod" --display-name="my-prod"
$ oc new-project my-dev --description="my-dev" --display-name="my-dev"

$ cat <<'EOF' >>cloudbeesCD-Config-Generator.sh
#!/bin/bash

export projectName=$1
export serviceAccount=$2

oc delete -n $projectName serviceaccount $serviceAccount
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
$ ./cloudbeesCD-Config-Generator.sh my-prod my-prod-sa 
$ ./cloudbeesCD-Config-Generator.sh my-dev my-dev-sa 
```

## Step 2 : Cloudbees CD 설정

1. Cloudbees CD 에 두 개의 Configuration 을 생성
   - Configuration 파일에 정리된 명령을 실행
   - Plugins -> EC-Openshift -> Configure
       - Openshift API Endpoint : https://test.letsgohomenow.com:8443
       - Service Account
           - Name : my-dev-sa
           - Bearer token : 토큰값 입력
   - Plugins -> EC-Openshift -> Configure
       - Openshift API Endpoint : https://test.letsgohomenow.com:8443
       - Service Account
           - Name : my-prod-sa
           - Bearer token : 토큰값 입력
2. Cloudbees CD 에 두 개의 Env 을 생성
   - New Environment
       - Name : my-dev
       - Cluster Type : Openshift
       - Cluster Name : my-dev
       - Configuration : my-dev-sa
       - Openshift Project : my-dev
   - New Environment
       - Name : my-prod
       - Cluster Type : Openshift
       - Configuration : my-prod-sa
       - Openshift Project : my-prod 
