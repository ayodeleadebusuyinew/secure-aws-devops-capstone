data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
  environment  = var.environment
}

module "security_group" {
  source       = "./modules/security-group"
  project_name = var.project_name
  environment  = var.environment
  vpc_id       = data.aws_vpc.default.id
  my_ip        = var.my_ip
}

module "ec2" {
  source                = "./modules/ec2"
  ami_id                = data.aws_ami.ubuntu.id
  instance_type         = var.instance_type
  key_name              = var.key_name
  subnet_id             = data.aws_subnets.default.ids[0]
  security_group_id     = module.security_group.security_group_id
  instance_profile_name = module.iam.instance_profile_name
  project_name          = var.project_name
  environment           = var.environment
}