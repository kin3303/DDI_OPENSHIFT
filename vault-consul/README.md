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
- Vault : http://<HOSTNAME>:8200/ui
- Consul : http://<HOSTNAME>:8500/ui
  
### Reference
- https://testdriven.io/managing-secrets-with-vault-and-consul
