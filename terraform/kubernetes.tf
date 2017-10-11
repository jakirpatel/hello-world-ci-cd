output "bastion_security_group_ids" {
  value = ["${aws_security_group.bastion-cluster-dockerslab-com.id}"]
}

output "bastions_role_arn" {
  value = "${aws_iam_role.bastions-cluster-dockerslab-com.arn}"
}

output "bastions_role_name" {
  value = "${aws_iam_role.bastions-cluster-dockerslab-com.name}"
}

output "cluster_name" {
  value = "cluster.dockerslab.com"
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-cluster-dockerslab-com.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-cluster-dockerslab-com.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-cluster-dockerslab-com.name}"
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-cluster-dockerslab-com.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.us-east-1a-cluster-dockerslab-com.id}", "${aws_subnet.us-east-1b-cluster-dockerslab-com.id}", "${aws_subnet.us-east-1c-cluster-dockerslab-com.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-cluster-dockerslab-com.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-cluster-dockerslab-com.name}"
}

output "region" {
  value = "us-east-1"
}

output "vpc_id" {
  value = "${aws_vpc.cluster-dockerslab-com.id}"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_autoscaling_attachment" "bastions-cluster-dockerslab-com" {
  elb                    = "${aws_elb.bastion-cluster-dockerslab-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.bastions-cluster-dockerslab-com.id}"
}

resource "aws_autoscaling_attachment" "master-us-east-1a-masters-cluster-dockerslab-com" {
  elb                    = "${aws_elb.api-cluster-dockerslab-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-east-1a-masters-cluster-dockerslab-com.id}"
}

resource "aws_autoscaling_attachment" "master-us-east-1b-masters-cluster-dockerslab-com" {
  elb                    = "${aws_elb.api-cluster-dockerslab-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-east-1b-masters-cluster-dockerslab-com.id}"
}

resource "aws_autoscaling_attachment" "master-us-east-1c-masters-cluster-dockerslab-com" {
  elb                    = "${aws_elb.api-cluster-dockerslab-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-east-1c-masters-cluster-dockerslab-com.id}"
}

resource "aws_autoscaling_group" "bastions-cluster-dockerslab-com" {
  name                 = "bastions.cluster.dockerslab.com"
  launch_configuration = "${aws_launch_configuration.bastions-cluster-dockerslab-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.utility-us-east-1a-cluster-dockerslab-com.id}", "${aws_subnet.utility-us-east-1b-cluster-dockerslab-com.id}", "${aws_subnet.utility-us-east-1c-cluster-dockerslab-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "cluster.dockerslab.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "bastions.cluster.dockerslab.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/bastion"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "master-us-east-1a-masters-cluster-dockerslab-com" {
  name                 = "master-us-east-1a.masters.cluster.dockerslab.com"
  launch_configuration = "${aws_launch_configuration.master-us-east-1a-masters-cluster-dockerslab-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-east-1a-cluster-dockerslab-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "cluster.dockerslab.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-east-1a.masters.cluster.dockerslab.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "master-us-east-1b-masters-cluster-dockerslab-com" {
  name                 = "master-us-east-1b.masters.cluster.dockerslab.com"
  launch_configuration = "${aws_launch_configuration.master-us-east-1b-masters-cluster-dockerslab-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-east-1b-cluster-dockerslab-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "cluster.dockerslab.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-east-1b.masters.cluster.dockerslab.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "master-us-east-1c-masters-cluster-dockerslab-com" {
  name                 = "master-us-east-1c.masters.cluster.dockerslab.com"
  launch_configuration = "${aws_launch_configuration.master-us-east-1c-masters-cluster-dockerslab-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-east-1c-cluster-dockerslab-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "cluster.dockerslab.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-east-1c.masters.cluster.dockerslab.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "nodes-cluster-dockerslab-com" {
  name                 = "nodes.cluster.dockerslab.com"
  launch_configuration = "${aws_launch_configuration.nodes-cluster-dockerslab-com.id}"
  max_size             = 3
  min_size             = 3
  vpc_zone_identifier  = ["${aws_subnet.us-east-1a-cluster-dockerslab-com.id}", "${aws_subnet.us-east-1b-cluster-dockerslab-com.id}", "${aws_subnet.us-east-1c-cluster-dockerslab-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "cluster.dockerslab.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.cluster.dockerslab.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_ebs_volume" "a-etcd-events-cluster-dockerslab-com" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster    = "cluster.dockerslab.com"
    Name                 = "a.etcd-events.cluster.dockerslab.com"
    "k8s.io/etcd/events" = "a/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "a-etcd-main-cluster-dockerslab-com" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster    = "cluster.dockerslab.com"
    Name                 = "a.etcd-main.cluster.dockerslab.com"
    "k8s.io/etcd/main"   = "a/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "b-etcd-events-cluster-dockerslab-com" {
  availability_zone = "us-east-1b"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster    = "cluster.dockerslab.com"
    Name                 = "b.etcd-events.cluster.dockerslab.com"
    "k8s.io/etcd/events" = "b/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "b-etcd-main-cluster-dockerslab-com" {
  availability_zone = "us-east-1b"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster    = "cluster.dockerslab.com"
    Name                 = "b.etcd-main.cluster.dockerslab.com"
    "k8s.io/etcd/main"   = "b/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "c-etcd-events-cluster-dockerslab-com" {
  availability_zone = "us-east-1c"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster    = "cluster.dockerslab.com"
    Name                 = "c.etcd-events.cluster.dockerslab.com"
    "k8s.io/etcd/events" = "c/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "c-etcd-main-cluster-dockerslab-com" {
  availability_zone = "us-east-1c"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster    = "cluster.dockerslab.com"
    Name                 = "c.etcd-main.cluster.dockerslab.com"
    "k8s.io/etcd/main"   = "c/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_eip" "us-east-1a-cluster-dockerslab-com" {
  vpc = true
}

resource "aws_eip" "us-east-1b-cluster-dockerslab-com" {
  vpc = true
}

resource "aws_eip" "us-east-1c-cluster-dockerslab-com" {
  vpc = true
}

resource "aws_elb" "api-cluster-dockerslab-com" {
  name = "api-cluster-dockerslab-co-cqumk8"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-cluster-dockerslab-com.id}"]
  subnets         = ["${aws_subnet.utility-us-east-1a-cluster-dockerslab-com.id}", "${aws_subnet.utility-us-east-1b-cluster-dockerslab-com.id}", "${aws_subnet.utility-us-east-1c-cluster-dockerslab-com.id}"]

  health_check = {
    target              = "TCP:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "cluster.dockerslab.com"
    Name              = "api.cluster.dockerslab.com"
  }
}

resource "aws_elb" "bastion-cluster-dockerslab-com" {
  name = "bastion-cluster-dockersla-ojnv62"

  listener = {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.bastion-elb-cluster-dockerslab-com.id}"]
  subnets         = ["${aws_subnet.utility-us-east-1a-cluster-dockerslab-com.id}", "${aws_subnet.utility-us-east-1b-cluster-dockerslab-com.id}", "${aws_subnet.utility-us-east-1c-cluster-dockerslab-com.id}"]

  health_check = {
    target              = "TCP:22"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "cluster.dockerslab.com"
    Name              = "bastion.cluster.dockerslab.com"
  }
}

resource "aws_iam_instance_profile" "bastions-cluster-dockerslab-com" {
  name = "bastions.cluster.dockerslab.com"
  role = "${aws_iam_role.bastions-cluster-dockerslab-com.name}"
}

resource "aws_iam_instance_profile" "masters-cluster-dockerslab-com" {
  name = "masters.cluster.dockerslab.com"
  role = "${aws_iam_role.masters-cluster-dockerslab-com.name}"
}

resource "aws_iam_instance_profile" "nodes-cluster-dockerslab-com" {
  name = "nodes.cluster.dockerslab.com"
  role = "${aws_iam_role.nodes-cluster-dockerslab-com.name}"
}

resource "aws_iam_role" "bastions-cluster-dockerslab-com" {
  name               = "bastions.cluster.dockerslab.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_bastions.cluster.dockerslab.com_policy")}"
}

resource "aws_iam_role" "masters-cluster-dockerslab-com" {
  name               = "masters.cluster.dockerslab.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.cluster.dockerslab.com_policy")}"
}

resource "aws_iam_role" "nodes-cluster-dockerslab-com" {
  name               = "nodes.cluster.dockerslab.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.cluster.dockerslab.com_policy")}"
}

resource "aws_iam_role_policy" "bastions-cluster-dockerslab-com" {
  name   = "bastions.cluster.dockerslab.com"
  role   = "${aws_iam_role.bastions-cluster-dockerslab-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_bastions.cluster.dockerslab.com_policy")}"
}

resource "aws_iam_role_policy" "masters-cluster-dockerslab-com" {
  name   = "masters.cluster.dockerslab.com"
  role   = "${aws_iam_role.masters-cluster-dockerslab-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.cluster.dockerslab.com_policy")}"
}

resource "aws_iam_role_policy" "nodes-cluster-dockerslab-com" {
  name   = "nodes.cluster.dockerslab.com"
  role   = "${aws_iam_role.nodes-cluster-dockerslab-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.cluster.dockerslab.com_policy")}"
}

resource "aws_internet_gateway" "cluster-dockerslab-com" {
  vpc_id = "${aws_vpc.cluster-dockerslab-com.id}"

  tags = {
    KubernetesCluster = "cluster.dockerslab.com"
    Name              = "cluster.dockerslab.com"
  }
}

resource "aws_key_pair" "kubernetes-cluster-dockerslab-com-22dfc614fb1a1c57eb2c93a05a183eb6" {
  key_name   = "kubernetes.cluster.dockerslab.com-22:df:c6:14:fb:1a:1c:57:eb:2c:93:a0:5a:18:3e:b6"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.cluster.dockerslab.com-22dfc614fb1a1c57eb2c93a05a183eb6_public_key")}"
}

resource "aws_launch_configuration" "bastions-cluster-dockerslab-com" {
  name_prefix                 = "bastions.cluster.dockerslab.com-"
  image_id                    = "ami-08431d73"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-cluster-dockerslab-com-22dfc614fb1a1c57eb2c93a05a183eb6.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.bastions-cluster-dockerslab-com.id}"
  security_groups             = ["${aws_security_group.bastion-cluster-dockerslab-com.id}"]
  associate_public_ip_address = true

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 32
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "master-us-east-1a-masters-cluster-dockerslab-com" {
  name_prefix                 = "master-us-east-1a.masters.cluster.dockerslab.com-"
  image_id                    = "ami-08431d73"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-cluster-dockerslab-com-22dfc614fb1a1c57eb2c93a05a183eb6.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-cluster-dockerslab-com.id}"
  security_groups             = ["${aws_security_group.masters-cluster-dockerslab-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-east-1a.masters.cluster.dockerslab.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "master-us-east-1b-masters-cluster-dockerslab-com" {
  name_prefix                 = "master-us-east-1b.masters.cluster.dockerslab.com-"
  image_id                    = "ami-08431d73"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-cluster-dockerslab-com-22dfc614fb1a1c57eb2c93a05a183eb6.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-cluster-dockerslab-com.id}"
  security_groups             = ["${aws_security_group.masters-cluster-dockerslab-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-east-1b.masters.cluster.dockerslab.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "master-us-east-1c-masters-cluster-dockerslab-com" {
  name_prefix                 = "master-us-east-1c.masters.cluster.dockerslab.com-"
  image_id                    = "ami-08431d73"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-cluster-dockerslab-com-22dfc614fb1a1c57eb2c93a05a183eb6.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-cluster-dockerslab-com.id}"
  security_groups             = ["${aws_security_group.masters-cluster-dockerslab-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-east-1c.masters.cluster.dockerslab.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "nodes-cluster-dockerslab-com" {
  name_prefix                 = "nodes.cluster.dockerslab.com-"
  image_id                    = "ami-08431d73"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-cluster-dockerslab-com-22dfc614fb1a1c57eb2c93a05a183eb6.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-cluster-dockerslab-com.id}"
  security_groups             = ["${aws_security_group.nodes-cluster-dockerslab-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.cluster.dockerslab.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "us-east-1a-cluster-dockerslab-com" {
  allocation_id = "${aws_eip.us-east-1a-cluster-dockerslab-com.id}"
  subnet_id     = "${aws_subnet.utility-us-east-1a-cluster-dockerslab-com.id}"
}

resource "aws_nat_gateway" "us-east-1b-cluster-dockerslab-com" {
  allocation_id = "${aws_eip.us-east-1b-cluster-dockerslab-com.id}"
  subnet_id     = "${aws_subnet.utility-us-east-1b-cluster-dockerslab-com.id}"
}

resource "aws_nat_gateway" "us-east-1c-cluster-dockerslab-com" {
  allocation_id = "${aws_eip.us-east-1c-cluster-dockerslab-com.id}"
  subnet_id     = "${aws_subnet.utility-us-east-1c-cluster-dockerslab-com.id}"
}

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.cluster-dockerslab-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.cluster-dockerslab-com.id}"
}

resource "aws_route" "private-us-east-1a-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-east-1a-cluster-dockerslab-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-east-1a-cluster-dockerslab-com.id}"
}

resource "aws_route" "private-us-east-1b-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-east-1b-cluster-dockerslab-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-east-1b-cluster-dockerslab-com.id}"
}

resource "aws_route" "private-us-east-1c-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-east-1c-cluster-dockerslab-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-east-1c-cluster-dockerslab-com.id}"
}

resource "aws_route53_record" "api-cluster-dockerslab-com" {
  name = "api.cluster.dockerslab.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-cluster-dockerslab-com.dns_name}"
    zone_id                = "${aws_elb.api-cluster-dockerslab-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z1NP8CR0MUF9SC"
}

resource "aws_route53_record" "bastion-cluster-dockerslab-com" {
  name = "bastion.cluster.dockerslab.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.bastion-cluster-dockerslab-com.dns_name}"
    zone_id                = "${aws_elb.bastion-cluster-dockerslab-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z1NP8CR0MUF9SC"
}

resource "aws_route_table" "cluster-dockerslab-com" {
  vpc_id = "${aws_vpc.cluster-dockerslab-com.id}"

  tags = {
    KubernetesCluster = "cluster.dockerslab.com"
    Name              = "cluster.dockerslab.com"
  }
}

resource "aws_route_table" "private-us-east-1a-cluster-dockerslab-com" {
  vpc_id = "${aws_vpc.cluster-dockerslab-com.id}"

  tags = {
    KubernetesCluster = "cluster.dockerslab.com"
    Name              = "private-us-east-1a.cluster.dockerslab.com"
  }
}

resource "aws_route_table" "private-us-east-1b-cluster-dockerslab-com" {
  vpc_id = "${aws_vpc.cluster-dockerslab-com.id}"

  tags = {
    KubernetesCluster = "cluster.dockerslab.com"
    Name              = "private-us-east-1b.cluster.dockerslab.com"
  }
}

resource "aws_route_table" "private-us-east-1c-cluster-dockerslab-com" {
  vpc_id = "${aws_vpc.cluster-dockerslab-com.id}"

  tags = {
    KubernetesCluster = "cluster.dockerslab.com"
    Name              = "private-us-east-1c.cluster.dockerslab.com"
  }
}

resource "aws_route_table_association" "private-us-east-1a-cluster-dockerslab-com" {
  subnet_id      = "${aws_subnet.us-east-1a-cluster-dockerslab-com.id}"
  route_table_id = "${aws_route_table.private-us-east-1a-cluster-dockerslab-com.id}"
}

resource "aws_route_table_association" "private-us-east-1b-cluster-dockerslab-com" {
  subnet_id      = "${aws_subnet.us-east-1b-cluster-dockerslab-com.id}"
  route_table_id = "${aws_route_table.private-us-east-1b-cluster-dockerslab-com.id}"
}

resource "aws_route_table_association" "private-us-east-1c-cluster-dockerslab-com" {
  subnet_id      = "${aws_subnet.us-east-1c-cluster-dockerslab-com.id}"
  route_table_id = "${aws_route_table.private-us-east-1c-cluster-dockerslab-com.id}"
}

resource "aws_route_table_association" "utility-us-east-1a-cluster-dockerslab-com" {
  subnet_id      = "${aws_subnet.utility-us-east-1a-cluster-dockerslab-com.id}"
  route_table_id = "${aws_route_table.cluster-dockerslab-com.id}"
}

resource "aws_route_table_association" "utility-us-east-1b-cluster-dockerslab-com" {
  subnet_id      = "${aws_subnet.utility-us-east-1b-cluster-dockerslab-com.id}"
  route_table_id = "${aws_route_table.cluster-dockerslab-com.id}"
}

resource "aws_route_table_association" "utility-us-east-1c-cluster-dockerslab-com" {
  subnet_id      = "${aws_subnet.utility-us-east-1c-cluster-dockerslab-com.id}"
  route_table_id = "${aws_route_table.cluster-dockerslab-com.id}"
}

resource "aws_security_group" "api-elb-cluster-dockerslab-com" {
  name        = "api-elb.cluster.dockerslab.com"
  vpc_id      = "${aws_vpc.cluster-dockerslab-com.id}"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster = "cluster.dockerslab.com"
    Name              = "api-elb.cluster.dockerslab.com"
  }
}

resource "aws_security_group" "bastion-cluster-dockerslab-com" {
  name        = "bastion.cluster.dockerslab.com"
  vpc_id      = "${aws_vpc.cluster-dockerslab-com.id}"
  description = "Security group for bastion"

  tags = {
    KubernetesCluster = "cluster.dockerslab.com"
    Name              = "bastion.cluster.dockerslab.com"
  }
}

resource "aws_security_group" "bastion-elb-cluster-dockerslab-com" {
  name        = "bastion-elb.cluster.dockerslab.com"
  vpc_id      = "${aws_vpc.cluster-dockerslab-com.id}"
  description = "Security group for bastion ELB"

  tags = {
    KubernetesCluster = "cluster.dockerslab.com"
    Name              = "bastion-elb.cluster.dockerslab.com"
  }
}

resource "aws_security_group" "masters-cluster-dockerslab-com" {
  name        = "masters.cluster.dockerslab.com"
  vpc_id      = "${aws_vpc.cluster-dockerslab-com.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster = "cluster.dockerslab.com"
    Name              = "masters.cluster.dockerslab.com"
  }
}

resource "aws_security_group" "nodes-cluster-dockerslab-com" {
  name        = "nodes.cluster.dockerslab.com"
  vpc_id      = "${aws_vpc.cluster-dockerslab-com.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster = "cluster.dockerslab.com"
    Name              = "nodes.cluster.dockerslab.com"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-cluster-dockerslab-com.id}"
  source_security_group_id = "${aws_security_group.masters-cluster-dockerslab-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-cluster-dockerslab-com.id}"
  source_security_group_id = "${aws_security_group.masters-cluster-dockerslab-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-cluster-dockerslab-com.id}"
  source_security_group_id = "${aws_security_group.nodes-cluster-dockerslab-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-cluster-dockerslab-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-cluster-dockerslab-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-elb-cluster-dockerslab-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-to-master-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-cluster-dockerslab-com.id}"
  source_security_group_id = "${aws_security_group.bastion-cluster-dockerslab-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "bastion-to-node-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-cluster-dockerslab-com.id}"
  source_security_group_id = "${aws_security_group.bastion-cluster-dockerslab-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-cluster-dockerslab-com.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-cluster-dockerslab-com.id}"
  source_security_group_id = "${aws_security_group.api-elb-cluster-dockerslab-com.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-cluster-dockerslab-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-cluster-dockerslab-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-cluster-dockerslab-com.id}"
  source_security_group_id = "${aws_security_group.nodes-cluster-dockerslab-com.id}"
  from_port                = 1
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-cluster-dockerslab-com.id}"
  source_security_group_id = "${aws_security_group.nodes-cluster-dockerslab-com.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-cluster-dockerslab-com.id}"
  source_security_group_id = "${aws_security_group.nodes-cluster-dockerslab-com.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-elb-to-bastion" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.bastion-cluster-dockerslab-com.id}"
  source_security_group_id = "${aws_security_group.bastion-elb-cluster-dockerslab-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "ssh-external-to-bastion-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.bastion-elb-cluster-dockerslab-com.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "us-east-1a-cluster-dockerslab-com" {
  vpc_id            = "${aws_vpc.cluster-dockerslab-com.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "us-east-1a"

  tags = {
    KubernetesCluster                              = "cluster.dockerslab.com"
    Name                                           = "us-east-1a.cluster.dockerslab.com"
    "kubernetes.io/cluster/cluster.dockerslab.com" = "owned"
  }
}

resource "aws_subnet" "us-east-1b-cluster-dockerslab-com" {
  vpc_id            = "${aws_vpc.cluster-dockerslab-com.id}"
  cidr_block        = "172.20.64.0/19"
  availability_zone = "us-east-1b"

  tags = {
    KubernetesCluster                              = "cluster.dockerslab.com"
    Name                                           = "us-east-1b.cluster.dockerslab.com"
    "kubernetes.io/cluster/cluster.dockerslab.com" = "owned"
  }
}

resource "aws_subnet" "us-east-1c-cluster-dockerslab-com" {
  vpc_id            = "${aws_vpc.cluster-dockerslab-com.id}"
  cidr_block        = "172.20.96.0/19"
  availability_zone = "us-east-1c"

  tags = {
    KubernetesCluster                              = "cluster.dockerslab.com"
    Name                                           = "us-east-1c.cluster.dockerslab.com"
    "kubernetes.io/cluster/cluster.dockerslab.com" = "owned"
  }
}

resource "aws_subnet" "utility-us-east-1a-cluster-dockerslab-com" {
  vpc_id            = "${aws_vpc.cluster-dockerslab-com.id}"
  cidr_block        = "172.20.0.0/22"
  availability_zone = "us-east-1a"

  tags = {
    KubernetesCluster                              = "cluster.dockerslab.com"
    Name                                           = "utility-us-east-1a.cluster.dockerslab.com"
    "kubernetes.io/cluster/cluster.dockerslab.com" = "owned"
  }
}

resource "aws_subnet" "utility-us-east-1b-cluster-dockerslab-com" {
  vpc_id            = "${aws_vpc.cluster-dockerslab-com.id}"
  cidr_block        = "172.20.4.0/22"
  availability_zone = "us-east-1b"

  tags = {
    KubernetesCluster                              = "cluster.dockerslab.com"
    Name                                           = "utility-us-east-1b.cluster.dockerslab.com"
    "kubernetes.io/cluster/cluster.dockerslab.com" = "owned"
  }
}

resource "aws_subnet" "utility-us-east-1c-cluster-dockerslab-com" {
  vpc_id            = "${aws_vpc.cluster-dockerslab-com.id}"
  cidr_block        = "172.20.8.0/22"
  availability_zone = "us-east-1c"

  tags = {
    KubernetesCluster                              = "cluster.dockerslab.com"
    Name                                           = "utility-us-east-1c.cluster.dockerslab.com"
    "kubernetes.io/cluster/cluster.dockerslab.com" = "owned"
  }
}

resource "aws_vpc" "cluster-dockerslab-com" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                              = "cluster.dockerslab.com"
    Name                                           = "cluster.dockerslab.com"
    "kubernetes.io/cluster/cluster.dockerslab.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "cluster-dockerslab-com" {
  domain_name         = "ec2.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster = "cluster.dockerslab.com"
    Name              = "cluster.dockerslab.com"
  }
}

resource "aws_vpc_dhcp_options_association" "cluster-dockerslab-com" {
  vpc_id          = "${aws_vpc.cluster-dockerslab-com.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.cluster-dockerslab-com.id}"
}

terraform = {
  required_version = ">= 0.9.3"
}
