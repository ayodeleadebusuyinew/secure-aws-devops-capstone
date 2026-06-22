# Secure AWS DevOps Capstone Runbook

## Project Overview

This project demonstrates a secure, automated, and monitored AWS infrastructure using DevOps, DevSecOps, and observability practices.

## Core Components

- Terraform for AWS infrastructure provisioning
- AWS EC2 for application hosting
- IAM role and instance profile for controlled permissions
- Security Group with restricted inbound access
- AWS Secrets Manager for secure secret storage
- Checkov for Infrastructure-as-Code security scanning
- OPA for policy-as-code enforcement
- Jenkins for CI/CD automation
- S3 remote backend for shared Terraform state
- Node Exporter for EC2 system metrics
- Prometheus for metrics collection
- Grafana for dashboard visualization

## Deployment Flow

1. Developer pushes code to GitHub.
2. Jenkins pulls the repository.
3. Jenkins verifies required tools.
4. Terraform format and validation checks run.
5. Checkov scans Terraform code for security misconfigurations.
6. Terraform creates a plan using the S3 remote backend.
7. OPA evaluates the Terraform plan against custom policies.
8. Terraform apply runs after successful validation.
9. Security and policy reports are archived in Jenkins.
10. Node Exporter exposes EC2 metrics.
11. Prometheus scrapes EC2 metrics.
12. Grafana visualizes system performance.

## Validation Commands

```bash
terraform fmt -check -recursive
terraform init
terraform validate
terraform plan -var-file=envs/jenkins.tfvars
checkov -d terraform
opa eval --data security/opa/terraform-policy.rego --input terraform/tfplan.json "data.terraform.security.deny"
curl http://100.58.229.250:9100/metrics | head