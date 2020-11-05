## Docker 설치

- Tested with 24GB memory, 8 cores,  Ubuntu 16.04 LTS  

```console
  $ sudo su 
  $ sysctl -w vm.max_map_count=262144
  $ sysctl -w fs.file-max=65536
  $ ulimit -n 65536
  $ ulimit -u 4096
  $ git clone https://github.com/kin3303/DDI_OPENSHIFT.git
  $ cd DDI_OPENSHIFT
  $ git checkout testEnv
  $ cd jenkins
  $ chmod +x install.sh && ./install.sh
  $ docker swarm init
```


## Jenkins 설치

### Step 1. Jenkins 이미지 빌드 및 저장 (Option)

- Docker on Docker 되도록 Jenkins 이미지 빌드 후 저장
- 수행후 Docker Compose 파일의 Jenkins 이미지 이름수정 필요
- SCM 에 있는 Dockerfile 기준 1회만 수행
- Dockierfile 에 추가로 작업이 필요 없는 경우 구어놓은 kin3303/jenkins-docker:latest 사용해도 됨

```console
  $ cd ./build
  $ docker login
  $ docker build -t kin3303/jenkins-docker:latest .
  $ docker push kin3303/jenkins-docker:latest 
```

###  Step 2 도메인, SSL 설정

1. 테스트할 도메인을 준비
2. `traefik.yaml` 을 열어 `Challenge HTTP` 섹션의  `email:`  을 수정 
3. `docker-compose.yaml` 파일을 열어 `- sonarqube.letsgohomenow.com` 에 sonarqube 도메인을 입력 

###  Step 3. Jenkins 배포

```console
  $ docker stack rm traefik
  $ docker stack deploy -c docker-compose.yaml traefik 
```

### Step 4. Potainer 활성화

- Portainer 는 5분 내에 admin 계정을 생성해야 사용 가능하다. 

```
  Portainer - http://your-ip-address:9000
```
