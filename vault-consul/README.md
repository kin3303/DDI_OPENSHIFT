### Docker 설치
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
```

### Vault, Consul 설치
```console
  $ docker-compose up -d --build
```

### Vault, Consul 접근
- Vault : http://YOUR_HOST:8200/ui
- Consul : http://YOUR_HOST:8500/ui

### Unseal & Authenticate

``` console
$ docker-compose exec vault bash

# vault operator init
# vault operator unseal <UnsealKey1>
# vault operator unseal <UnsealKey2>
# vault operator unseal <UnsealKey3>
# vault login <TOKEN>
```
  
### Auditing

``` console
$ docker-compose exec vault bash
bash-5.0# vault audit enable file file_path=/vault/logs/audit.log
Success! Enabled the file audit device at: file/

# vault audit list
Path     Type    Description
----     ----    -----------
file/    file    n/a
```


### Secrets

#### 정적

새로고침 간격은 있지만 명시적으로 취소되지 않는 한 만료되지 않는다.
키/값 으로 미리 정으한 다음 공유한다.

1. Secret 활성화

``` console
bash-5.0# vault secrets enable kv
```

#### 동적

필요에 따라 생성되고 짧은 기간 후에 만료된다.
접근하기 전까지는 존재하지 않기 때문에 노출이 적다. 

### Reference
- https://testdriven.io/managing-secrets-with-vault-and-consul
