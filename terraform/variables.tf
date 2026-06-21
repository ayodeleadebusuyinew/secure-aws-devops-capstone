variable "aws_region" {
  description = "AWS region for the capstone infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment such as dev, staging, or prod"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name used for AWS resource naming"
  type        = string
  default     = "secure-devops-capstone"
}

variable "my_ip" {
  description = "Your public IP address allowed to access SSH and dashboards"
  type        = string
}

variable "key_name" {
  description = "AWS EC2 key pair name"
  type        = string
  default     = "devops-capstone-key"
}

variable "instance_type" {
  description = "EC2 instance type for the application server"
  type        = string
  default     = "t3.small"
}