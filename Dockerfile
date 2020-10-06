FROM jenkins/jenkins:lts
USER root

RUN sed -i 's/archive/kr.archive/g' /etc/apt/sources.list
RUN sed -i 's/kr.archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

RUN apt-get update && \
apt-get install -y --no-install-recommends net-tools iputils-ping curl vim 

RUN mkdir -p /tmp/download && \
curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.03.1-ce.tgz | tar -xz -C /tmp/download && \
rm -rf /tmp/download/docker/dockerd && \
mv /tmp/download/docker/docker* /usr/local/bin/ && \
rm -rf /tmp/download

#RUN echo "deb http://security.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list
#RUN apt-get update -y && apt-get install -y --no-install-recommends \
#    libssl1.0.0 libssl-dev

#RUN ln -s /lib/x86_64-linux-gnu/libssl.so.1.0.0 /lib/x86_64-linux-gnu/libssl.so.10
#RUN ln -s /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /lib/x86_64-linux-gnu/libcrypto.so.10

RUN groupadd -g 999 docker
RUN usermod -aG staff,docker jenkins

#RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER jenkins
