
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
  $ cd nexus
  $ chmod +x install.sh
  $ ./install.sh
  $ docker swarm init
  $ docker stack rm traefik
```

## Nexus 실행 
 
###  Step 1. 설정

1. 도메인 의 A Record 로 테스트할 도메인을 준비한다.
2. `traefik.yaml` 을 열어 `Challenge HTTP` 섹션의  `email:`  을 수정 
3. `docker-compose.yaml` 파일을 열어 `- "traefik.http.routers.nexus.rule=Host(`your_domain_here`)"` 의 도메인을 입력

###  Step 2. Nexus 배포

```console
  $ docker stack deploy -c docker-compose.yml traefik 
```

배포 후 https://your_domain_here 에 들어가 확인한다.


## Portainer 설정

- Portainer 는 5분 내에 admin 계정을 생성해야 사용 가능하다. 

```
  Portainer - http://your-ip-address:9000
```
