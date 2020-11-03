# Openshift Pipeline 설계 정리 


## 02. NEXUS

### Install Nexus 
* [Install Nexus](https://github.com/kin3303/DDI_OPENSHIFT/tree/testEnv/nexus)

### Setup Nexus Configuration
* [Nexus Configuration](https://github.com/kin3303/DDI_OPENSHIFT/blob/testEnv/conf/README-Openshift%20%EC%99%B8%EB%B6%80%20Registry%20(Nexus)%20%EC%97%B0%EA%B2%B0.md)


## 01. JENKINS

### Install Jenkins
* [Install Jenkins](https://github.com/kin3303/DDI_OPENSHIFT/tree/testEnv/jenkins)

### Setup Jenkins Docker Plugin & Test Setup
- 아래 example 에는 nexus private repository 를 사용하도록 설정해 놓았다.
- misc/Jenkinsfile 을 열어 nexus private repository 정보를 바꿔 사용하면 된다.
* [Install Docker Plugin](https://github.com/kin3303/nodejs-ex/tree/master/misc)


## 03. Cloudbees CD

### Setup Openshift Configuration
* [Openshift Configuration](https://github.com/kin3303/DDI_OPENSHIFT/blob/testEnv/conf/README-CB-Openshift%20%ED%94%8C%EB%9F%AC%EA%B7%B8%EC%9D%B8%20Configuration%20%EC%83%9D%EC%84%B1%EB%B0%A9%EB%B2%95.md)
