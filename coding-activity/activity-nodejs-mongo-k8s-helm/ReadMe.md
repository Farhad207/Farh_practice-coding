<h1 id="my-custom-anchor-name">
  deploy nodejs and mongo using helm
</h1>

* install helm on the cluster

```javascript
helm version
version.BuildInfo{Version:"v3.5.2", GitCommit:"167aac70832d3a384f65f9745335e9fb40169dc2", GitTreeState:"dirty", GoVersion:"go1.15.7"}

$ helm install farhadnodejsapp nodejs/
NAME: farhadnodejsapp
LAST DEPLOYED: Sun Feb 28 18:58:05 2021
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
  export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services farhadnodejsapp)
  export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT
ubuntu@ip-172-31-2-74:~/Farh_practice-coding$ kubectl get po
NAME                      READY   STATUS    RESTARTS   AGE
app-7c54c5d78d-nmbz9      1/1     Running   0          38s
mongodb-b55b6c8fd-f2qkt   1/1     Running   0          38s
ubuntu@ip-172-31-2-74:~/Farh_practice-coding$
ubuntu@ip-172-31-2-74:~/Farh_practice-coding$
ubuntu@ip-172-31-2-74:~/Farh_practice-coding$ kubectl get svc
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)           AGE
app          NodePort    10.111.92.87     <none>        5000:31110/TCP    48s
kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP           3h51m
mongodb      NodePort    10.101.206.191   <none>        27017:30655/TCP   48s
ubuntu@ip-172-31-2-74:~/Farh_practice-coding$ helm list
NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART           APP VERSION
farhadnodejsapp default         1               2021-02-28 18:58:05.653730659 +0000 UTC deployed        nodejs-0.1.0    1.16.0
```
