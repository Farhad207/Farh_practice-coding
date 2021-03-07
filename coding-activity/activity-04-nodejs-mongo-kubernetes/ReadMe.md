<h1 id="my-custom-anchor-name">
  Node.js and mongodb application on kubernetes
</h1>

* create a docker image and push it to the repository 
```javascript
$docker build -t farhad207/nojesapp .
```
* perform a docker login
```javascript 
$docker login -u farhad207
password:
login succeeded
```
* perofrm a docker push

```javascript
docker push farhad207/nodejs-mongodb 
```

* deploy the application using k8s files


```javascript
 kubectl apply -f .
deployment.apps/app configured
service/app configured
persistentvolumeclaim/mongodb-claim0 configured
deployment.apps/mongodb configured
persistentvolume/mongodb-pv unchanged
service/mongodb configured
```
* check all the resources 

```javascript

$ kubectl get svc
NAME         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)           AGE
app          NodePort    10.99.194.97   <none>        5000:31110/TCP    67m
kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP           69m
mongodb      NodePort    10.98.236.37   <none>        27017:32167/TCP   67m

kubectl get storageclass
NAME     PROVISIONER                RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
manual   k8s.io/minikube-hostpath   Retain          Immediate           false                  155m

$ kubectl get pods
NAME                       READY   STATUS    RESTARTS   AGE
app-c7d8b48d8-njb2c        1/1     Running   0          15s
mongodb-5b89f5789f-lx9wk   1/1     Running   0          14s


 kubectl logs app-c7d8b48d8-njb2c
yarn run v1.22.5
$ node app.js
(node:29) Warning: Accessing non-existent property 'count' of module exports inside circular dependency
(Use `node --trace-warnings ...` to show where the warning was created)
(node:29) Warning: Accessing non-existent property 'findOne' of module exports inside circular dependency
(node:29) Warning: Accessing non-existent property 'remove' of module exports inside circular dependency
(node:29) Warning: Accessing non-existent property 'updateOne' of module exports inside circular dependency
listening on port 5000
MongoDB connected...

```

![](/images/coding-activity/activity-04-nodejs-mongo-kubernetes/k8s_app_running_on_port_31110.PNG)


* please see the screenshots
![](/images/coding-activity/activity-04-nodejs-mongo-kubernetes/K8s_app_and_mongo_connected.PNG)



