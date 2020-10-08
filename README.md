## DDI_OKD_DEMO

- Openshift 에서 Cloudbees CD 와 연계하여 nodejs app 배포를 위한 Demo Project


## Step 1. Jenkins 초기화

```
1. Docker Pipeline 플러그인 설치
2. dockerHub 에 로그인하기 위한 Credential 을 Jenkins 에 추가
    Credentials -> Add Credentials (구버전)
    Manage Jenkins -> Manage Credentials -> Provider : Jenkins -> Global credentials  -> Add Credentials (최신버전)
        Kind : Username with password
        Scope : Global
        Username : dockerHub 계정명
        Password : dockerHub 패스워드
        ID : docker-hub
        Description : docker-hub
        
3. 프로젝트 추가
    New Item
        ItemName : nodejs-pipe
        ItemType : Pipeline

4. 프로젝트 Configure
    Configure
        Advanced Project Options
            Pipeline
                Definition : Pipeline script from SCM
                SCM : Git
                Repository URL : https://github.com/kin3303/DDI_OPENSHIFT.git
                Branches to build : */dockerPlugin
                Script Path : misc/Jenkinsfile
```
