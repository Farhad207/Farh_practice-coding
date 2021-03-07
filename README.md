<h1 id="my-custom-anchor-name">
  CICD for Nodejs and MongoDB
</h1>

-	I have used GitHub, AWS, Docker, terraform, Kubernetes and helm to build a fully automated infrastructure and CI/CD solution
-	I have used Github as a SCM tool to mange my code, added the dockerfile , created the image using github actions and pushed the same to docker repository(docker hub) completing my continuous integration.
-	I have used terraform to build the infrastructure resources such as VPC, subnets, EC2 ELB, security groups etc. Then used KOPS to build Kubernetes cluster. 
-	I Created the kompose file to bring the nodejs and mongodb application up. 
-	I have Installed the helm charts to deploy the application 

when i cloned the Git hub Repository and tried to run the yarn, and Yarn start, I got the import errors as shown below:

![](/images/terraform/013_yarn_error.PNG)

* Resolution for above Error: I added conts todos and users as shown below, I used require instead of from and const instead of import. This can be found in the commit (commit id - 4b8beaef905ff5248190b0c21cf36e6d895ac27c)
const todos = require("./routes/todos");
// db config	const users = require("./routes/users");


*	When I again ran the yarn start  I received the Mangoose schema not registered errors, as shown below 
![](/images/terraform/014_mangoose.PNG)

```javascript
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






