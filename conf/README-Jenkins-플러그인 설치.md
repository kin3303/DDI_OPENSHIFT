# Jenkins 환경구성 - Docker Plugin
 
## Step 1. Docker Plugin 설치 및 Repository 연결

```
  1. Docker Pipeline 플러그인 설치
  2. dockerHub 에 로그인하기 위한 Credential 을 Jenkins 에 추가 
      Manage Jenkins -> Manage Credentials -> Provider : Jenkins -> Global credentials  -> Add Credentials (최신버전)
        Kind : Username with password
        Scope : Global
        Username : dockerHub 계정명
        Password : dockerHub 패스워드
        ID : docker-hub
        Description : docker-hub
```

# Jenkins 환경구성 - Jenkins 와 Openshift Cluster 연결 방법

## Step 1 : Jenkins 에 Openshift Client Plugin 설치
 
- Manage Jenkins => Manage Plugins => Available Tab => Filter 로 "Openshift" 입력후 아래 설정을 진행

```
  1. 플러그인 선택
     - Openshift Client
     - Openshift Login
     - Openshift Sync
  2. Download now and install after restart 선택
  3. Jenkins 재시작
  4. 재시작후 설치된 플러그인에 위 플러그인들이 제대로 들어갔는지 확인
```

## Step 2 : Global Tool Configuration 설정

- Manage Jenkins => Global Tool Configuration 으로 이동해 아래 설정을 진행

```
  1. Openshift Client Tools 
    - Add OpenShift Client Tools 클릭
      - Name : oc
      - Install automatically : 체크
      - Add Openshift Client Tools 클릭
      - "Extract *.zip/*.tar.gz" 선택
      - Openshift About 페이지에서 Openshift 버전 확인 후 https://mirror.openshift.com/pub 에서 알맞은 Client 의 URL 을 복사
      - Download URL for binary archive : https://mirror.openshift.com/pub/openshift-v3/clients/3.11.0-0.32.0/linux/oc.tar.gz
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
```

## Step 3 : Openshift Cluster 추가 설정

- Manage Jenkins => Configure System 으로 이동해 아래 설정을 진행

```
  1. Cluster Configuration
    - Add OpenShift Cluster 클릭
      - Cluster Name : openshift-cluster
      - API Server URL : oc login --server=<이 값을 복사> --token=<TOKEN>
      - Disable TLS Verify : 체크
      - Credentials : Add 하여 추가 후 해당 Credential 선택
        - Kind : Openshift Token for Openshift Client Plugin
        - Token : 로그인 토큰 ( oc whoami -t )
        - ID : my-user-token
    - Apply 버튼 클릭 
```


