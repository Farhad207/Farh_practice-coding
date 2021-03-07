<h1 id="my-custom-anchor-name">
  Build the resources using Terraform (Infrastructure as a code) 
</h1>

*	Create an AWS instance and install the required packages such as pip, aws-cli . terraform then configure aws cli using AWS access Key ID and secret access key.
```javascript
$ sudo apt-get install python2-pip
$ sudo pip install awscli
$ Install the kubectl binaries 
$	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
$	mv ./kubectl ~/usr/bin 
```
![](/images/terraform/001_kubectl.PNG)

* Similarly, download the latet version of Kops binaries and copy to the bin directory  
 ```javascript
 $ curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 
 ```
 ![](/images/terraform/002_kops.PNG)

 
 * check terraform version
```javascript
$ terraform -v
Terraform v0.12.24
```
* create a public key 

```javascript
$ ls -lrt ~/.ssh/farhadkop.pub
-rw-r--r-- 1 ubuntu ubuntu 404 Feb 26 10:15 /home/ubuntu/.ssh/farhadkop.pub
```

* Create an S3 bucket to keep the state files
![](/images/terraform/003_create_an_S3.PNG)

* Create a hosted zone
![](/images/terraform/005_hosted_zone.PNG)

* after creation 
!![](/images/terraform/004_create_the_hosted_zone.PNG)

* create kubernetes cluster 
 ```javascript
 $ kops create cluster \
  --name=testkop.farhad.com  \
  --state=s3://kops.farhad.com \
  --authorization RBAC \
  --zones=us-east-1a\
  --node-count=1 \
  --node-size=t2.micro \
  --master-size=t2.medium \
  --master-count=1 \
  --dns-zone=farhad.com \
  --out=kopskubernetes_terraform \
  --target=terraform \
  --ssh-public-key=~/.ssh/farhadkop.pub
```
* Kubernetes,tf file will be created 
![](/images/terraform/006_terraform_cluster_file.PNG)

* execute the terraform file to create the cluster
```javascript
$ cd kopskubernetes_terraform
/kopskubernetes_terraform$
	
	
$ ls -lrt
total 28
-rw-r--r-- 1 ubuntu ubuntu 23769 Feb 28 07:37 kubernetes.tf
drwxr-xr-x 2 ubuntu ubuntu  4096 Feb 28 07:37 data

```


