# Openshift 와 Cloudbees CD 를 연동하기 위한 프로젝트

- 사전 준비사항 
  - Jenkins 설치 및 Jenkins 에 docker plugin 설치
  - oc client 를 설치
 
## Step 1 : 준비사항

1. 기존 프로젝트의 Deployment, Service, Route 정보를 Template 파일로 제작
   - deploy-template.yaml 파일 참조
2. my-dev, my-prod 프로젝트를 생성
3. my-dev, my-prod 프로젝트에 ImageStream 을 Import
   - imageStream.yaml 파일 참조
4. Cloudbees CD 에 두 개의 Configuration 을 생성
   - Configuration 파일에 정리된 명령을 실행
5. Cloudbees CD 에 두 개의 Env 을 생성
   - New Environment
       - Name : my-dev
       - Cluster Type : Openshift
       - Configuration : my-dev-sa
       - Openshift Project : my-dev
   - New Environment
       - Name : my-prod
       - Cluster Type : Openshift
       - Configuration : my-prod-sa
       - Openshift Project : my-prod 
4. Cloudbees CD Catalog 를 사용해  Tempalte 파일 임포트
   - Catalog -> Import Openshift Template
       - OpenShift Template Content (YAML File) : 

5. Service-Env 맵핑 Configuration 을 열어 변수로 처리할 부분을 변경
   - Map -> Microservice Configuration -> Container Configuration -> Version : $[/myPipelineRuntime/tagName]

