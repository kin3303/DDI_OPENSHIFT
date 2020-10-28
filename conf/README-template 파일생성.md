프로젝트 를 template 으로 export 하는 방법

``` console 
$ oc export all --as-template=nodejsApp.yaml 
```

프로젝트중 필요 Resource 만 template form 으로 export 하는 방법

``` console
$ oc export bc,is,deployment,route,svc,pvc,limitranges,resourcequotas -l app=nodejs-ex-git --as-template='templateName' >nodejsApp.yaml
```

Resource 이름 얻는 방법

``` console
$  oc api-resources --namespaced=true -o name
```
