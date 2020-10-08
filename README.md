# Openshift 와 Cloudbees CD 를 연동하기 위한 프로젝트

- 사전 준비사항 
  - Jenkins 설치 및 docker plugin 이 필요

 
## Step 1 : 준비사항

1. 기존 프로젝트의 Deployment, Service, Route 정보를 Template 으로 제작 => deploy-template.yaml
2. my-dev, my-prod 프로젝트를 생성
3. Cloudbees CD 에 두 개의 Configuration 을 생성
