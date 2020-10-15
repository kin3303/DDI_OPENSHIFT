
# Cloudbees CD 에서  Openshift Configuration 생성 방법 

EC-Openshift 는 각 프로젝트 별로 SA 계정에 권한을 부여하고 그 토큰을 Secret 으로 관리하고 있다.
따라서 SA 계정을 생성하여 프로젝트에 액세스 할 수 있는 권한을 부여하고 SA 계정의 Secret 을 얻어 Access Token 을 얻어내야 한다. 
관련하여 admin 권한을 가진 계정으로 먼저 로그인하고 사용할 프로젝트는 만들어 놓는다.


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
$ oc new-project cbcd --description="my-prod" --display-name="my-prod"
$ oc new-project cbcd --description="my-dev" --display-name="my-dev"

$ cat >cloudbeesCD-Config-Generator.sh <<EOF
#!/bin/bash
export projectName=$1
export serviceAccount=$2
oc create -n $projectName serviceaccount $serviceAccount
oc adm policy add-role-to-user admin system:serviceaccount:cbcd:erobot
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
