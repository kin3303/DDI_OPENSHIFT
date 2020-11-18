## 프로젝트 를 template 으로 export 하는 방법

``` console 
$ oc export all --as-template=TemplateName > template.yaml
```

## Resource 이름 얻는 방법

``` console
$  oc api-resources --namespaced=true -o name
```

## 프로젝트중 필요 Resource export 하는 방법

``` console
$ for object in deploymentconfigs deployments buildconfigs secrets limitranges resourcequotas pvc
do
  oc get -o yaml --export $object > $object.yaml
done
``` 

## Template Format

https://docs.openshift.com/container-platform/3.6/dev_guide/templates.html



