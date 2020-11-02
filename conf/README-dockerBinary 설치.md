
## Step 1.  Docker Binary 다운로드 

```console

$ wget https://download.docker.com/linux/static/stable/x86_64/docker-18.06.3-ce.tgz
$ tar xvf docker-18.06.3-ce.tgz
$ chmod +x docker
$ sudo chmod +x docker/*
$ sudo cp docker/* /usr/bin/

# Docker 그룹에 현재 User 추가
$ sudo groupadd docker
$ sudo usermod -aG docker $USER
```

## Step 2. Docker 서비스 생성

```console
$ cat <<'EOF' >>/lib/systemd/system/docker.service
[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network-online.target docker.socket firewalld.service
Wants=network-online.target
Requires=docker.socket

[Service]
Type=notify
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
ExecStart=/usr/local/bin/dockerd -H fd://
ExecReload=/bin/kill -s HUP $MAINPID
LimitNOFILE=1048576
# Having non-zero Limit*s causes performance problems due to accounting overhead
# in the kernel. We recommend using cgroups to do container-local accounting.
LimitNPROC=infinity
LimitCORE=infinity
# Uncomment TasksMax if your systemd version supports it.
# Only systemd 226 and above support this version.
TasksMax=infinity
TimeoutStartSec=0
# set delegate yes so that systemd does not reset the cgroups of docker containers
Delegate=yes
# kill only the docker process, not all processes in the cgroup
KillMode=process
# restart the docker process if it exits prematurely
Restart=on-failure
StartLimitBurst=3
StartLimitInterval=60s

[Install]
WantedBy=multi-user.target
EOF
```


## Step 3. Docker 소켓 생성

```console
$ cat <<'EOF' >>/lib/systemd/system/docker.socket
[Unit]
Description=Docker Socket for the API
PartOf=docker.service

[Socket]
ListenStream=/var/run/docker.sock
SocketMode=0660
SocketUser=root
SocketGroup=docker

[Install]
WantedBy=sockets.target
EOF
```


## Step 4. Docker 서비스 시작

```console
$ sudo su
$ systemctl daemon-reload
$ systemctl enable docker
$ systemctl start docker
```
