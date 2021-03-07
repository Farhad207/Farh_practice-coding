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
* please execute the terraform plan command to show the infrastructure 
```javascript
$ terraform plan -out=kops_fartest.com
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_autoscaling_group.master-us-east-1a-masters-testkop-farhad-com will be created
  + resource "aws_autoscaling_group" "master-us-east-1a-masters-testkop-farhad-com" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = (known after apply)
```

* execute terraform apply 
```javascript
$ terraform apply

  # aws_launch_template.master-us-east-1a-masters-testkop-farhad-com will be created
  + resource "aws_launch_template" "master-us-east-1a-masters-testkop-farhad-com" {
      + arn             = (known after apply)
      + default_version = (known after apply)
      + id              = (known after apply)
      + image_id        = "ami-0074ee617a234808d"
      + instance_type   = "t2.medium"
      + key_name        = (known after apply)
      + latest_version  = (known after apply)
      + name            = "master-us-east-1a.masters.testkop.farhad.com"
      + tags            = {
          + "KubernetesCluster"                                                            = "testkop.farhad.com"
          + "Name"                                                                         = "master-us-east-1a.masters.testkop.farhad.com"
          + "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"      = "master-us-east-1a"
          + "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"             = "master"
          + "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master" = ""
          + "k8s.io/role/master"                                                           = "1"
          + "kops.k8s.io/instancegroup"                                                    = "master-us-east-1a"
          + "kubernetes.io/cluster/testkop.farhad.com"                                     = "owned"
        }

  # aws_security_group_rule.ssh-external-to-master-0-0-0-0--0 will be created
  + resource "aws_security_group_rule" "ssh-external-to-master-0-0-0-0--0" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 22
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 22
      + type                     = "ingress"
    }

  # aws_security_group_rule.ssh-external-to-node-0-0-0-0--0 will be created
  + resource "aws_security_group_rule" "ssh-external-to-node-0-0-0-0--0" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 22
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 22
      + type                     = "ingress"
    }


# aws_subnet.us-east-1a-testkop-farhad-com will be created
  + resource "aws_subnet" "us-east-1a-testkop-farhad-com" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-east-1a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "172.20.32.0/19"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "KubernetesCluster"                        = "testkop.farhad.com"
          + "Name"                                     = "us-east-1a.testkop.farhad.com"
          + "SubnetType"                               = "Public"
          + "kubernetes.io/cluster/testkop.farhad.com" = "owned"
          + "kubernetes.io/role/elb"                   = "1"
        }
      + vpc_id                          = (known after apply)
    }

# aws_vpc.testkop-farhad-com will be created
  + resource "aws_vpc" "testkop-farhad-com" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "172.20.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = true
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "KubernetesCluster"                        = "testkop.farhad.com"
          + "Name"                                     = "testkop.farhad.com"
          + "kubernetes.io/cluster/testkop.farhad.com" = "owned"
        }
    }
```    

* kubernetes.tf file will create the below infrastructure
![](/images/terraform/007_terraform_apply.PNG)

* created VPC, subnets internet gateway , security groups and Ec2 instances from terraform 
![](/images/terraform/008_cluster_created.PNG)

* check the vpc 
![](/images/terraform/009_vpc_created.PNG)

* verifying the routing table 
![](/images/terraform/010_routing.PNG)

* tfstate file created in S3
![](/images/terraform/011_S3.PNG)

* check nodes status using kubectl 
![](/images/terraform/012_nodes.PNG)
