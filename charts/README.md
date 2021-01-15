
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

## Cloudbees CD Agent 설치

```console
  $ sudo su
  $ groupadd ubuntu
  $ useradd -m -g ubuntu ubuntu
  $ echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
  $ chmod 777 <Cloudbees-CD-Installfile>
  $ ./<Cloudbees-CD-Installfile> --mode silent --installAgent --unixAgentUser ubuntu --unixAgentGroup ubuntu  --remoteServer 182.162.101.234
```

## Chart Museum 설치
 
###  Step 1 도메인, SSL 설정

1. 테스트할 도메인을 준비
2. `traefik.yaml` 을 열어 `Challenge HTTP` 섹션의  `email:`  을 수정 
3. `docker-compose.yaml` 파일을 열어 `- chart.letsgohomenow.com` 에 Chart Museum 도메인을 입력 


###  Step 3. Chart Museum 배포

~/.helm/repository/local 위치에 Chart 저장소 볼륨이 연결된다.
 따라서 적절한 사용자로 변경후 컨테이너를 배포해야 한다.
 
```console
  $ su ubuntu
  $ docker stack rm chart
  $ docker stack deploy -c docker-compose.yaml chart 
```

### Step 4. Potainer 활성화

- Portainer 는 5분 내에 admin 계정을 생성해야 사용 가능하다. 

```
  Portainer - http://your-ip-address:9000
```


## Helm Museum 설치

배포가 필요한 위치에 Helm 을 설치하자.

```console
  $ su ubuntu
  $ wget https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz
  $ tar -zxvf helm-v3.2.4-linux-amd64.tar.gz
  $ mv linux-amd64/helm /usr/bin/helm
  $ helm
```

## Helm Museum 레포지토리 추가

```console
  $ helm repo add stable https://charts.helm.sh/stable
  $ helm repo add myrepo https://<YourDomain>
  $ helm repo update
```

## Helm Museum 레포지토리 에 Chart 저장

```console
  $ helm create repotest
  $ helm package repotest/
  $ curl --data-binary "@repotest-0.1.0.tgz" https://<YourDomain>/api/charts
  $ helm repo update
  $ helm search repo myrepo
```

## CloudBees CD 와 통신 설정

플러그인에서 복사 기능을 제공하지만 실제로 동작하지 않는다.
따라서 아래와 같이 수동으로 ./kube/config 파일을 복사하자.

```console
  $ cat /root/.kube
  ...
  $ cp -r /root/.kube /home/ubuntu/
```

