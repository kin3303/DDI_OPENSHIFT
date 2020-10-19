프로젝트에서 사용중인 리소스 확인 방법
``` console
$ oc get -o yaml --export all > project.yaml
```

리소스별 Export 방법
``` console
$ for object in rolebindings serviceaccounts secrets imagestreamtags cm egressnetworkpolicies rolebindingrestrictions limitranges resourcequotas pvc templates cronjobs statefulsets hpa deployments replicasets poddisruptionbudget endpoints
do
  oc get -o yaml --export $object > $object.yaml
done
```

API 리소스 얻는 방법

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
