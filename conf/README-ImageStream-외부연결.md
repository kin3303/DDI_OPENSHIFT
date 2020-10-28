ImageStream 을 외부 Repository 를 통해 생성하기 위해서는 아래와 같이 설정한다.

```
apiVersion: v1 
kind: ImageStream
metadata:
  name: nodejs-image
spec:
  dockerImageRepository: kin3303/nodejs-demo
```
