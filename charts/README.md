
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

## Chart Museum 설치
 
###  Step 1 도메인, SSL 설정

1. 테스트할 도메인을 준비
2. `traefik.yaml` 을 열어 `Challenge HTTP` 섹션의  `email:`  을 수정 
3. `docker-compose.yaml` 파일을 열어 `- chart.letsgohomenow.com` 에 Chart Museum 도메인을 입력 

###  Step 3. Chart Museum 배포

```console
  $ sudo su
  $ groupadd ubuntu
  $ useradd -m -g ubuntu ubuntu
  $ echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
  $ su ubuntu
  $ docker stack rm chart
  $ docker stack deploy -c docker-compose.yaml chart 
```

### Step 4. Potainer 활성화

- Portainer 는 5분 내에 admin 계정을 생성해야 사용 가능하다. 

```
  Portainer - http://your-ip-address:9000
```
