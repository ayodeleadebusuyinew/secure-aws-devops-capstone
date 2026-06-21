#checkov:skip=CKV_AWS_88:Public IP is required for this capstone lab because there is no ALB, VPN, or private subnet bastion yet. In production this EC2 would be private behind an ALB.
#checkov:skip=CKV_AWS_135:t2.micro is used due to AWS account vCPU quota limitation and does not support explicit EBS optimization like larger production instances.

resource "aws_instance" "capstone_server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  iam_instance_profile        = var.instance_profile_name
  associate_public_ip_address = true
  monitoring                  = true

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx curl wget
              systemctl enable nginx
              systemctl start nginx
              echo "<h1>Secure AWS DevOps Capstone</h1><p>Provisioned by Terraform and prepared for Jenkins CI/CD, DevSecOps, and monitoring.</p>" > /var/www/html/index.html
              EOF

  tags = {
    Name        = "${var.project_name}-${var.environment}-app-server"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
    Security    = "Hardened"
  }
}