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
bindings
configmaps
endpoints
events
limitranges
persistentvolumeclaims
pods
podtemplates
replicationcontrollers
resourcequotas
secrets
serviceaccounts
services
controllerrevisions.apps
daemonsets.apps
deployments.apps
replicasets.apps
statefulsets.apps
deploymentconfigs.apps.openshift.io
localsubjectaccessreviews.authorization.k8s.io
localresourceaccessreviews.authorization.openshift.io
localsubjectaccessreviews.authorization.openshift.io
rolebindingrestrictions.authorization.openshift.io
rolebindings.authorization.openshift.io
roles.authorization.openshift.io
selfsubjectrulesreviews.authorization.openshift.io
subjectrulesreviews.authorization.openshift.io
horizontalpodautoscalers.autoscaling
cronjobs.batch
jobs.batch
buildconfigs.build.openshift.io
builds.build.openshift.io
events.events.k8s.io
daemonsets.extensions
deployments.extensions
ingresses.extensions
networkpolicies.extensions
replicasets.extensions
imagestreamimages.image.openshift.io
imagestreamimports.image.openshift.io
imagestreammappings.image.openshift.io
imagestreams.image.openshift.io
imagestreamtags.image.openshift.io
egressnetworkpolicies.network.openshift.io
networkpolicies.networking.k8s.io
poddisruptionbudgets.policy
appliedclusterresourcequotas.quota.openshift.io
rolebindings.rbac.authorization.k8s.io
roles.rbac.authorization.k8s.io
routes.route.openshift.io
podsecuritypolicyreviews.security.openshift.io
podsecuritypolicyselfsubjectreviews.security.openshift.io
podsecuritypolicysubjectreviews.security.openshift.io
processedtemplates.template.openshift.io
templateinstances.template.openshift.io
templates.template.openshift.io
```
