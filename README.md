<h1 id="my-custom-anchor-name">
  CICD for Nodejs and MongoDB
</h1>

-	I have used GitHub, AWS, Docker, terraform, Kubernetes and helm to build a fully automated infrastructure and CI/CD solution
-	I have used Github as a SCM tool to mange my code, added the dockerfile , created the image using github actions and pushed the same to docker repository(docker hub) completing my continuous integration.
-	I have used terraform to build the infrastructure resources such as VPC, subnets, EC2 ELB, security groups etc. Then used KOPS to build Kubernetes cluster. 
-	I Created the kompose file to bring the nodejs and mongodb application up. 
-	I have Installed the helm charts to deploy the application 

when i cloned the Git hub Repository and tried to run the yarn, and Yarn start, I got the import errors as shown below:

```javascript
$ yarn install
yarn install v1.22.5
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
[4/4] Building fresh packages...
Done in 1.45s.

$ yarn start
yarn run v1.22.5
$ node app.js
/home/ubuntu/coding-task-devops/app/app.js:3
import todos from "./routes/todos";
^^^^^^

SyntaxError: Unexpected token import
    at createScript (vm.js:80:10)
    at Object.runInThisContext (vm.js:139:10)
    at Module._compile (module.js:616:28)
    at Object.Module._extensions..js (module.js:663:10)
    at Module.load (module.js:565:32)
    at tryModuleLoad (module.js:505:12)
    at Function.Module._load (module.js:497:3)
    at Function.Module.runMain (module.js:693:10)
    at startup (bootstrap_node.js:188:16)
    at bootstrap_node.js:609:3
error Command failed with exit code 1.

```



![](/images/terraform/013_yarn_error.PNG)

* Resolution for above Error: I added conts todos and users as shown below, I used require instead of from and const instead of import. This can be found in the commit (commit id - 4b8beaef905ff5248190b0c21cf36e6d895ac27c)
const todos = require("./routes/todos");
// db config	const users = require("./routes/users");


*	When I again ran the yarn start  I received the Mangoose schema not registered errors, as shown below 
![](/images/terraform/014_mangoose.PNG)

```javascript
$ yarn start
ERROR throw new mongoose.Error.MissingSchemaError(name);
      ^
MongooseError [MissingSchemaError]: Schema hasn't been registered for model "users".
Use mongoose.model(name, schema)
    at new MissingSchemaError (/home/ubuntu/Farh_practice-coding/app/node_modules/mongoose/lib/error/missingSchema.js:22:11)
    at Mongoose.model (/home/ubuntu/Farh_practice-coding/app/node_modules/mongoose/lib/index.js:497:13)
    at Object.<anonymous> (/home/ubuntu/Farh_practice-coding/app/config/passport.js:6:23)
    at Module._compile (internal/modules/cjs/loader.js:999:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:1027:10)
    at Module.load (internal/modules/cjs/loader.js:863:32)
    at Function.Module._load (internal/modules/cjs/loader.js:708:14)
    at Module.require (internal/modules/cjs/loader.js:887:19)
    at require (internal/modules/cjs/helpers.js:74:18)
    at Object.<anonymous> (/home/ubuntu/Farh_practice-coding/app/app.js:5:16)
    at Module._compile (internal/modules/cjs/loader.js:999:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:1027:10)
    at Module.load (internal/modules/cjs/loader.js:863:32)
    at Function.Module._load (internal/modules/cjs/loader.js:708:14)
    at Function.executeUserEntryPoint [as runMain] (internal/modules/run_main.js:60:12)
    at internal/main/run_main_module.js:17:47
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.

```
* Resolution ---
 
The above errors were fixed by adding the require(“../ module/user’) above the express as shown in the screenshot (CommitID from github 1823c5a25d4b3fc68043d407751c42bb789fb436) 



![](/images/terraform/015_mangoose_fixed.PNG)


<h1 id="my-custom-anchor-name">
  Continuous integration
</h1>

* Containerize the application.
For containerizing the application, I used docker as a runtime engine and wrote a Dockerfie which is attached in my repository

* Build the image and push it to dockerhub 
I used github actions here >>write your own workflows option. I added the below code to build the image and did the integration with Dockerhub to push it as and when we have a commit.

Github -> dockerhub integration

1.	Go to your github acount click on builds
2.	Click on link to github 
3.	Give your source repository, select the repo from where you want to push the images 
4.	Select the branch and save the settings. 

* Creating the CI pipleine , add the github actions
![](/images/terraform/016_github_actions.PNG)

* Create a docker repository in dockerhub
![](/images/terraform/017_docker_hub.PNG)

* now link the github repository 
![](/images/terraform/018_add_github_from_dockerHub.PNG)

* add the github repository and the branch from which the image has to be pulled
![](/images/terraform/019_add_the_branch.PNG)

* integrated the Github and Docker hub repo
```javascript
docker pull farhad207/nodejs-mongodb
```
![](/images/terraform/020_added_docker_pull.PNG)


<h1 id="my-custom-anchor-name">
  Continoud deployment 
</h1>

Once the image is pushed from github to Docker hub through continuous integration , Helm will pull the image and deploy the application 
I used Kubernetes to deploy nodejs and mongodb app using helm .
Below are the steps to be followed

* install helm3 
```javascript
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm version
version.BuildInfo{Version:"v3.5.2", GitCommit:"167aac70832d3a384f65f9745335e9fb40169dc2", GitTreeState:"dirty", GoVersion:"go1.15.7
```

* Database not connected error fixed 

When I deployed the application with mongodb://localhost/tododbdev in database config , The application did not connect to the DB. Hence I changed the localhost to mongodb which fixed the errors

```javascript
Before 
module.exports = {
    mongoURI: 'mongodb://localhost/tododb-dev'
};
After fixing
module.exports = {
    mongoURI: 'mongodb://mongodb/tododb-dev'
};
```

* Deploy application using helm

I have created helm charts in the folder nodejs. 

```javascript
git clone https://github.com/Farhad207/Farh_practice-coding.git
:~/Farh_practice-coding$ ls -lrt
total 12
drwxrwxr-x 8 ubuntu ubuntu 4096 Feb 28 18:47 app
-rw-rw-r-- 1 ubuntu ubuntu   22 Feb 28 18:47 README.md
drwxrwxr-x 3 ubuntu ubuntu 4096 Feb 28 18:50 nodejs
```
* pull the image from dockerhub and add the same to values.yaml 

```javascript
'vi values.yaml
# Default values for nodejs.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: 1

image:
  repository: farhad207/nodejs-mongodb
  # Overrides the image tag whose default is the chart appVersion.
  tag: "latest"

port:
  container: 5000


service:
  type: NodePort
  port: 5000


mongopv:
  storageclassname: manual
  hostpath: "/mnt/mongo_data"

provisioner:
  storageclassname: manual
  storageclasspath: k8s.io/minikube-hostpath

mongodeploy:
  imagename: mongo

mongosvc:
  type: NodePort


```

* Run the application using helm install

```javascript

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

$ kubectl get po
NAME                      READY   STATUS    RESTARTS   AGE
app-7c54c5d78d-nmbz9      1/1     Running   0          38s
mongodb-b55b6c8fd-f2qkt   1/1     Running   0          38s
ubuntu@ip-172-31-2-74:~/Farh_practice-coding$
ubuntu@ip-172-31-2-74:~/Farh_practice-coding$

$ kubectl get svc
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)           AGE
app          NodePort    10.111.92.87     <none>        5000:31110/TCP    48s
kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP           3h51m
mongodb      NodePort    10.101.206.191   <none>        27017:30655/TCP   48s

helm list
NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART           APP VERSION
farhadnodejsapp default         1               2021-02-28 18:58:05.653730659 +0000 UTC deployed        nodejs-0.1.0    1.16.0

```


