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
키/값 으로 미리 정의한 다음 공유한다.

1. Secret 활성화

``` console
# vault secrets enable kv
```

2. Secret 쓰기

``` console
# vault kv put kv/foo bar=precious
Success! Data written to: kv/foo
```

3. Secret 읽기

``` console
# vault kv get kv/foo
=== Data ===
Key    Value
---    -----
bar    precious
```

4. Secret 버전관리

``` console
//Version Enable
# vault kv enable-versioning kv/
Success! Tuned the secrets engine at: kv/

//두번째 값 삽입
# vault kv put kv/foo bar=copper
Key              Value
---              -----
created_time     2020-04-23T13:59:41.4928751Z
deletion_time    n/a
destroyed        false
version          2

// 버전 확인
# vault kv get -version=1 kv/foo
# vault kv get -version=2 kv/foo
```

1. Secret Delete/Undelete/Destroy

``` console
# vault kv delete -versions=1 kv/foo
Success! Data deleted (if it existed) at: kv/foo

# vault kv undelete -versions=1 kv/foo
Success! Data written to: kv/undelete/foo

# vault kv destroy -versions=1 kv/foo
Success! Data written to: kv/destroy/foo
```


#### 동적

필요에 따라 생성되고 짧은 기간 후에 만료된다.
접근하기 전까지는 존재하지 않기 때문에 노출이 적다. 

### Reference
- https://testdriven.io/managing-secrets-with-vault-and-consul
