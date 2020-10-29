
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
```

## Nexus 설치

### Step 1. env 파일 설정

- email 과 your-ip-address 를 a record 로 등록한 domain 정보를 기입

###  Step 2. Nexus 설치

```console
  $ chmod +x start-nexus.sh
  $ ./start.sh
```

## Portainer 설정

- Portainer 는 5분 내에 admin 계정을 생성해야 사용 가능하다. 

```
  Portainer - http://your-ip-address:9000
```
