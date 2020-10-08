# Openshift 와 Cloudbees CD 를 연동하기 위한 프로젝트

- 사전 준비사항 
  - Jenkins 설치 및 Jenkins 에 docker plugin 설치
  - oc client 를 설치
 
## Step 1 : 준비사항

1. 기존 프로젝트의 Deployment, Service, Route 정보를 Template 파일로 제작
   - deploy-template.yaml 파일 참조
2. my-dev, my-prod 프로젝트를 생성
3.  my-dev, my-prod 프로젝트에 ImageStream 을 Import
   - imageStream.yaml 파일 참조
3. Cloudbees CD 에 두 개의 Configuration 을 생성
   - Configuration 파일 참조
4. Cloudbees CD Catalog 를 사용해  Tempalte 파일 임포트
   - Microservices 가 생성됨
5. Service-Env 맵핑 Configuration 을 열어 $[/myPipelineRuntime/tagName] 와 같이 Pipeline 의 Parameter 와 연동

