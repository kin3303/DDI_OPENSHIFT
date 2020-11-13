프로젝트 를 template 으로 export 하는 방법

``` console 
$ oc export all --as-template=TemplateName > template.yaml
```

프로젝트중 필요 Resource export 하는 방법

``` console
$ for object in deploymentconfigs imagestreams serviceaccounts secrets imagestreamtags cm limitranges resourcequotas pvc templates cronjobs statefulsets hpa deployments replicasets poddisruptionbudget endpoints
do
  oc get -o yaml --export $object > $object.yaml
done
``` 

이 경우 export 후 Template 폼으로 전환 필요 

https://docs.openshift.com/container-platform/3.6/dev_guide/templates.html


Resource 이름 얻는 방법

``` console
$  oc api-resources --namespaced=true -o name
```
