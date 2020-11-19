

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
  $ cd vault-consul
  $ chmod +x install.sh && ./install.sh
  $ docker swarm init
```


## Vault 설치 
 
###  Step 1. 도메인, SSL 설정

1. 테스트할 도메인을 두 개 준비( 하나는 vault 하나는 consul )
2. `traefik.yaml` 을 열어 `Challenge HTTP` 섹션의  `email:`  을 수정 
3. `docker-compose.yaml` 파일을 열어 `- valut.letsgohomenow.com` 에 vault 도메인을 입력
4. `docker-compose.yaml` 파일을 열어 `- consul.letsgohomenow.com` 에 consul 용 도메인을 입력 


###  Step 2. Vault 배포

```console
  $ docker stack rm vault
  $ docker stack deploy -c docker-compose.yaml vault 
```

### Step 3. Potainer 활성화

- Portainer 는 5분 내에 admin 계정을 생성해야 사용 가능하다. 

```
  Portainer - http://your-ip-address:9000
```
