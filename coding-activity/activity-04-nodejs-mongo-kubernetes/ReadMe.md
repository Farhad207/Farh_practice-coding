<h1 id="my-custom-anchor-name">
  Node.js and mongodb application on kubernetes
</h1>

```javascript
 kubectl apply -f .
deployment.apps/app configured
service/app configured
persistentvolumeclaim/mongodb-claim0 configured
deployment.apps/mongodb configured
persistentvolume/mongodb-pv unchanged
service/mongodb configured


$ kubectl get svc
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)           AGE
app          NodePort    10.102.229.231   <none>        5000:31110/TCP    30m
kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP           42m
mongodb      NodePort    10.101.119.69    <none>        27017:32398/TCP   30m

```
