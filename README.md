# 외부 Jenkins 와 Openshift Cluster 연결 방법

- Jenkins 가 이미 설치되어 있다면 아래 스텝들을 진행한다.

## Step 1 : Jenkins 에 Openshift Client Plugin 설치
 
Manage Jenkins => Manage Plugins => Available Tab => Filter 로 "Openshift" 입력후 아래 설정을 진행

1. 플러그인 선택
     - Openshift Client
     - Openshift Login
     - Openshift Sync
2. Download now and install after restart 선택
3. Jenkins 재시작
4. 재시작후 설치된 플러그인에 위 플러그인들이 제대로 들어갔는지 확인

## Step 2 : Global Tool Configuration 설정

Manage Jenkins => Global Tool Configuration 으로 이동해 아래 설정을 진행

1. Openshift Client Tools 
    - Add OpenShift Client Tools 클릭
      - Name : oc
      - Install automatically : 체크
      - Add Openshift Client Tools 클릭
      - "Extract *.zip/*.tar.gz" 선택
      - Openshift About 페이지에서 Openshift 버전 확인 후 https://mirror.openshift.com/pub 에서 알맞은 Client 의 URL 을 복사
      - Download URL for binary archive : https://mirror.openshift.com/pub/openshift-v3/clients/3.11.304/linux/oc.tar.gz
    - Apply 버튼 클릭  
2. JDK Installations (Openshift 플러그인 테스트용)
    - Add JDK 클릭
      - Jenkins 서버에서 JAVA_HOME 경로를 확인
      - Name : jdk8
      - Install Automatically : uncheck
      - JAVA_HOME : 확인한 경로 입력
    - Apply 버튼 클릭 
3.  Maven Installations (Openshift 플러그인 테스트용)
    - Add Maven 클릭
      - Name : maven-3.6.3
      - Install automatically : 체크
      - Install from Apache Version : 3.6.3
    - Apply 버튼 클릭 
    
## Step 3 : Openshift Cluster 추가 설정

Manage Jenkins => Configure System 으로 이동해 아래 설정을 진행

1. Cluster Configuration
    - Add OpenShift Cluster 클릭
      - Cluster Name : openshift-cluster
      - API Server URL : Openshift 4 PAAS 에서는 Openshift -> Administrator -> Dashboard -> Details 에 있음
      - Disable TLS Verify : 체크
      - Credentials : Add 하여 추가 후 해당 Credential 선택
        - Kind : Openshift Token for Openshift Client Plugin
        - Token : 로그인 토큰 ( co whoami -t )
        - ID : my-user-token
    - Apply 버튼 클릭 
    
## Step 4 : Openshift Cluster 연결 테스트 

1. Item Name : Openshift-Setup-Test , Project Type : Pipeline 

2. General
    - This project is parameterized
      - Add Parameter -> String Parameter -> Name : PROJECT_NAME, Trim the String 체크
      - Add Parameter -> String Parameter -> Name : CLUSTER_NAME, Default Value : openshift-cluster, Trim the String 체크 
3. Advanced Project Options
    - Pipeline -> Script -> https://github.com/kin3303/DDI_OPENSHIFT/blob/openshiftPlugin/Jenkinsfile 컨텐츠 삽입

4. Dashboard 로 이동 후 Openshift-Setup-Test 선택
    - Build with Parameters
      - PROJECT_NAME : jenkins-setup-test
      - CLUSTER_NAME : openshift-cluster

