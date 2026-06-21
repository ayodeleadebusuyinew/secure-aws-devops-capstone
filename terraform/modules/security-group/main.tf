resource "aws_security_group" "capstone_sg" {
  name        = "${var.project_name}-${var.environment}-sg"
  description = "Restricted security group for Secure AWS DevOps Capstone"
  vpc_id      = var.vpc_id

  ingress {
    description = "Restricted SSH access from engineer IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "HTTP access for application testing"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "Node Exporter metrics access"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    description = "Allow outbound internet access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-sg"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
  }
}