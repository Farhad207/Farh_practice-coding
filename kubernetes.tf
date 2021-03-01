locals {
  cluster_name                 = "testkop.farhad.com"
  master_autoscaling_group_ids = [aws_autoscaling_group.master-us-east-1a-masters-testkop-farhad-com.id]
  master_security_group_ids    = [aws_security_group.masters-testkop-farhad-com.id]
  masters_role_arn             = aws_iam_role.masters-testkop-farhad-com.arn
  masters_role_name            = aws_iam_role.masters-testkop-farhad-com.name
  node_autoscaling_group_ids   = [aws_autoscaling_group.nodes-us-east-1a-testkop-farhad-com.id]
  node_security_group_ids      = [aws_security_group.nodes-testkop-farhad-com.id]
  node_subnet_ids              = [aws_subnet.us-east-1a-testkop-farhad-com.id]
  nodes_role_arn               = aws_iam_role.nodes-testkop-farhad-com.arn
  nodes_role_name              = aws_iam_role.nodes-testkop-farhad-com.name
  region                       = "us-east-1"
  route_table_public_id        = aws_route_table.testkop-farhad-com.id
  subnet_us-east-1a_id         = aws_subnet.us-east-1a-testkop-farhad-com.id
  vpc_cidr_block               = aws_vpc.testkop-farhad-com.cidr_block
  vpc_id                       = aws_vpc.testkop-farhad-com.id
}

output "cluster_name" {
  value = "testkop.farhad.com"
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.master-us-east-1a-masters-testkop-farhad-com.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-testkop-farhad-com.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-testkop-farhad-com.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-testkop-farhad-com.name
output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-us-east-1a-testkop-farhad-com.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-testkop-farhad-com.id]
}

output "node_subnet_ids" {
  value = [aws_subnet.us-east-1a-testkop-farhad-com.id]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-testkop-farhad-com.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-testkop-farhad-com.name
}

output "region" {
  value = "us-east-1"
}

output "route_table_public_id" {
  value = aws_route_table.testkop-farhad-com.id
}

output "subnet_us-east-1a_id" {
  value = aws_subnet.us-east-1a-testkop-farhad-com.id
}

output "vpc_cidr_block" {
  value = aws_vpc.testkop-farhad-com.cidr_block
}
output "vpc_id" {
  value = aws_vpc.testkop-farhad-com.id
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_autoscaling_group" "master-us-east-1a-masters-testkop-farhad-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.master-us-east-1a-masters-testkop-farhad-com.id
    version = aws_launch_template.master-us-east-1a-masters-testkop-farhad-com.latest_version
  }
  max_size            = 1
  metrics_granularity = "1Minute"
  min_size            = 1
  name                = "master-us-east-1a.masters.testkop.farhad.com"
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "testkop.farhad.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "master-us-east-1a.masters.testkop.farhad.com"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-us-east-1a"
  }
  tag {
 key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-us-east-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/testkop.farhad.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1a-testkop-farhad-com.id]
}

resource "aws_autoscaling_group" "nodes-us-east-1a-testkop-farhad-com" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
 launch_template {
    id      = aws_launch_template.nodes-us-east-1a-testkop-farhad-com.id
    version = aws_launch_template.nodes-us-east-1a-testkop-farhad-com.latest_version
  }
  max_size            = 2
  metrics_granularity = "1Minute"
  min_size            = 2
  name                = "nodes-us-east-1a.testkop.farhad.com"
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "testkop.farhad.com"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-us-east-1a.testkop.farhad.com"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1a"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/testkop.farhad.com"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1a-testkop-farhad-com.id]
}

resource "aws_ebs_volume" "a-etcd-events-testkop-farhad-com" {
  availability_zone = "us-east-1a"
  encrypted         = false
  size              = 20
  tags = {
    "KubernetesCluster"                        = "testkop.farhad.com"
    "Name"                                     = "a.etcd-events.testkop.farhad.com"
    "k8s.io/etcd/events"                       = "a/a"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/testkop.farhad.com" = "owned"
  }
  type = "gp2"
}

resource "aws_ebs_volume" "a-etcd-main-testkop-farhad-com" {
  availability_zone = "us-east-1a"
  encrypted         = false
  size              = 20
  tags = {
    "KubernetesCluster"                        = "testkop.farhad.com"
    "Name"                                     = "a.etcd-main.testkop.farhad.com"
    "k8s.io/etcd/main"                         = "a/a"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/testkop.farhad.com" = "owned"
  }
  type = "gp2"
}

resource "aws_iam_instance_profile" "masters-testkop-farhad-com" {
  name = "masters.testkop.farhad.com"
  role = aws_iam_role.masters-testkop-farhad-com.name
}

resource "aws_iam_instance_profile" "nodes-testkop-farhad-com" {
  name = "nodes.testkop.farhad.com"
  role = aws_iam_role.nodes-testkop-farhad-com.name
}

resource "aws_iam_role_policy" "masters-testkop-farhad-com" {
  name   = "masters.testkop.farhad.com"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.testkop.farhad.com_policy")
  role   = aws_iam_role.masters-testkop-farhad-com.name
}

resource "aws_iam_role_policy" "nodes-testkop-farhad-com" {
  name   = "nodes.testkop.farhad.com"
 policy = file("${path.module}/data/aws_iam_role_policy_nodes.testkop.farhad.com_policy")
  role   = aws_iam_role.nodes-testkop-farhad-com.name
}

resource "aws_iam_role" "masters-testkop-farhad-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.testkop.farhad.com_policy")
  name               = "masters.testkop.farhad.com"
}

resource "aws_iam_role" "nodes-testkop-farhad-com" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.testkop.farhad.com_policy")
  name               = "nodes.testkop.farhad.com"
}

resource "aws_internet_gateway" "testkop-farhad-com" {
  tags = {
    "KubernetesCluster"                        = "testkop.farhad.com"
    "Name"                                     = "testkop.farhad.com"
    "kubernetes.io/cluster/testkop.farhad.com" = "owned"
  }
  vpc_id = aws_vpc.testkop-farhad-com.id
}

resource "aws_key_pair" "kubernetes-testkop-farhad-com-cb6af1d41320127bec1cf450a65da062" {
  key_name   = "kubernetes.testkop.farhad.com-cb:6a:f1:d4:13:20:12:7b:ec:1c:f4:50:a6:5d:a0:62"
  public_key = file("${path.module}/data/aws_key_pair_kubernetes.testkop.farhad.com-cb6af1d41320127bec1cf450a65da062_public_key")
  tags = {
    "KubernetesCluster"                        = "testkop.farhad.com"
    "Name"                                     = "testkop.farhad.com"
    "kubernetes.io/cluster/testkop.farhad.com" = "owned"
  }
}

resource "aws_launch_template" "master-us-east-1a-masters-testkop-farhad-com" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = false
      volume_size           = 64
      volume_type           = "gp2"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-testkop-farhad-com.id
  }
  image_id      = "ami-0074ee617a234808d"
  instance_type = "t2.medium"
  key_name      = aws_key_pair.kubernetes-testkop-farhad-com-cb6af1d41320127bec1cf450a65da062.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  name = "master-us-east-1a.masters.testkop.farhad.com"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.masters-testkop-farhad-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
 "KubernetesCluster"                                                            = "testkop.farhad.com"
      "Name"                                                                         = "master-us-east-1a.masters.testkop.farhad.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"      = "master-us-east-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"             = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master" = ""
      "k8s.io/role/master"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                    = "master-us-east-1a"
      "kubernetes.io/cluster/testkop.farhad.com"                                     = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                            = "testkop.farhad.com"
      "Name"                                                                         = "master-us-east-1a.masters.testkop.farhad.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"      = "master-us-east-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"             = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master" = ""
      "k8s.io/role/master"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                    = "master-us-east-1a"
      "kubernetes.io/cluster/testkop.farhad.com"                                     = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                            = "testkop.farhad.com"
    "Name"                                                                         = "master-us-east-1a.masters.testkop.farhad.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"      = "master-us-east-1a"
  "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"             = "master"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master" = ""
    "k8s.io/role/master"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                    = "master-us-east-1a"
    "kubernetes.io/cluster/testkop.farhad.com"                                     = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_master-us-east-1a.masters.testkop.farhad.com_user_data")
}

resource "aws_launch_template" "nodes-us-east-1a-testkop-farhad-com" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = false
      volume_size           = 128
      volume_type           = "gp2"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-testkop-farhad-com.id
  }
  image_id      = "ami-0074ee617a234808d"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.kubernetes-testkop-farhad-com-cb6af1d41320127bec1cf450a65da062.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
 http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  name = "nodes-us-east-1a.testkop.farhad.com"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.nodes-testkop-farhad-com.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "testkop.farhad.com"
      "Name"                                                                       = "nodes-us-east-1a.testkop.farhad.com"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-east-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1a"
      "kubernetes.io/cluster/testkop.farhad.com"                                   = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "testkop.farhad.com"
      "Name"                                                                       = "nodes-us-east-1a.testkop.farhad.com"
	    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-east-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1a"
      "kubernetes.io/cluster/testkop.farhad.com"                                   = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "testkop.farhad.com"
    "Name"                                                                       = "nodes-us-east-1a.testkop.farhad.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-east-1a"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1a"
    "kubernetes.io/cluster/testkop.farhad.com"                                   = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-us-east-1a.testkop.farhad.com_user_data")
}

resource "aws_route_table_association" "us-east-1a-testkop-farhad-com" {
  route_table_id = aws_route_table.testkop-farhad-com.id
  subnet_id      = aws_subnet.us-east-1a-testkop-farhad-com.id
}

resource "aws_route_table" "testkop-farhad-com" {
  tags = {
    "KubernetesCluster"                        = "testkop.farhad.com"
    "Name"                                     = "testkop.farhad.com"
    "kubernetes.io/cluster/testkop.farhad.com" = "owned"
    "kubernetes.io/kops/role"                  = "public"
  }
  vpc_id = aws_vpc.testkop-farhad-com.id
}

resource "aws_route" "route-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.testkop-farhad-com.id
  route_table_id         = aws_route_table.testkop-farhad-com.id
}

resource "aws_security_group_rule" "all-master-to-master" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-testkop-farhad-com.id
  source_security_group_id = aws_security_group.masters-testkop-farhad-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "all-master-to-node" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-testkop-farhad-com.id
  source_security_group_id = aws_security_group.masters-testkop-farhad-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "all-node-to-node" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-testkop-farhad-com.id
  source_security_group_id = aws_security_group.nodes-testkop-farhad-com.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "https-external-to-master-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-testkop-farhad-com.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "master-egress" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-testkop-farhad-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "node-egress" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
 protocol          = "-1"
  security_group_id = aws_security_group.nodes-testkop-farhad-com.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-testkop-farhad-com.id
  source_security_group_id = aws_security_group.nodes-testkop-farhad-com.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-testkop-farhad-com.id
  source_security_group_id = aws_security_group.nodes-testkop-farhad-com.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-testkop-farhad-com.id
  source_security_group_id = aws_security_group.nodes-testkop-farhad-com.id
  to_port                  = 65535
  type                     = "ingress"
}
resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-testkop-farhad-com.id
  source_security_group_id = aws_security_group.nodes-testkop-farhad-com.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "ssh-external-to-master-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-testkop-farhad-com.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "ssh-external-to-node-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.nodes-testkop-farhad-com.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group" "masters-testkop-farhad-com" {
  description = "Security group for masters"
  name        = "masters.testkop.farhad.com"
  tags = {
    "KubernetesCluster"                        = "testkop.farhad.com"
    "Name"                                     = "masters.testkop.farhad.com"
 "kubernetes.io/cluster/testkop.farhad.com" = "owned"
  }
  vpc_id = aws_vpc.testkop-farhad-com.id
}

resource "aws_security_group" "nodes-testkop-farhad-com" {
  description = "Security group for nodes"
  name        = "nodes.testkop.farhad.com"
  tags = {
    "KubernetesCluster"                        = "testkop.farhad.com"
    "Name"                                     = "nodes.testkop.farhad.com"
    "kubernetes.io/cluster/testkop.farhad.com" = "owned"
  }
  vpc_id = aws_vpc.testkop-farhad-com.id
}

resource "aws_subnet" "us-east-1a-testkop-farhad-com" {
  availability_zone = "us-east-1a"
  cidr_block        = "172.20.32.0/19"
  tags = {
    "KubernetesCluster"                        = "testkop.farhad.com"
    "Name"                                     = "us-east-1a.testkop.farhad.com"
    "SubnetType"                               = "Public"
    "kubernetes.io/cluster/testkop.farhad.com" = "owned"
 "kubernetes.io/role/elb"                   = "1"
  }
  vpc_id = aws_vpc.testkop-farhad-com.id
}

resource "aws_vpc_dhcp_options_association" "testkop-farhad-com" {
  dhcp_options_id = aws_vpc_dhcp_options.testkop-farhad-com.id
  vpc_id          = aws_vpc.testkop-farhad-com.id
}

resource "aws_vpc_dhcp_options" "testkop-farhad-com" {
  domain_name         = "ec2.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "KubernetesCluster"                        = "testkop.farhad.com"
    "Name"                                     = "testkop.farhad.com"
    "kubernetes.io/cluster/testkop.farhad.com" = "owned"
  }
}

resource "aws_vpc" "testkop-farhad-com" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "KubernetesCluster"                        = "testkop.farhad.com"
    "Name"                                     = "testkop.farhad.com"
    "kubernetes.io/cluster/testkop.farhad.com" = "owned"
  }
}

terraform {
  required_version = ">= 0.12.0"
}
                                  