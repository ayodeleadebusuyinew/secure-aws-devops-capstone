# Building a Secure, Automated, and Monitored AWS Infrastructure Using DevOps, DevSecOps, and AI Practices

## Executive Summary

This capstone project implemented a secure AWS infrastructure using Terraform, automated CI/CD through Jenkins, integrated DevSecOps security scanning with Checkov and OPA, and configured monitoring with Prometheus and Grafana.

The project demonstrates how modern DevOps teams can provision, secure, validate, automate, and monitor cloud infrastructure using repeatable Infrastructure-as-Code practices.

## Architecture

The solution includes:

- GitHub as the source control system
- Jenkins as the CI/CD automation engine
- Terraform for AWS provisioning
- AWS EC2 as the application server
- AWS IAM for role-based access
- AWS Security Groups for network restrictions
- AWS Secrets Manager for secure secret storage
- S3 remote backend for Terraform state
- Checkov for IaC security scanning
- OPA for custom policy enforcement
- Node Exporter for host-level metrics
- Prometheus for metrics scraping
- Grafana for dashboard visualization

## Security Controls Implemented

- Restricted SSH access to a single trusted IP
- Restricted HTTP access to a trusted IP
- Encrypted EC2 root volume
- EC2 detailed monitoring enabled
- IMDSv2 enforced
- IAM role attached to EC2
- Secrets stored in AWS Secrets Manager
- Terraform state stored remotely in an encrypted S3 bucket
- Checkov IaC scan integrated into Jenkins
- OPA policy check integrated into Jenkins

## CI/CD Pipeline

The Jenkins pipeline performs:

1. Source checkout from GitHub
2. Tool verification
3. Terraform format check
4. Terraform initialization
5. Terraform validation
6. Checkov security scan
7. Terraform plan
8. OPA policy evaluation
9. Terraform apply
10. Report artifact archiving

## Monitoring

The EC2 instance was configured with Node Exporter. Prometheus was configured to scrape the EC2 metrics endpoint on port 9100. Grafana was connected to Prometheus and used to visualize CPU, memory, disk, network, and system-level metrics.

## Final Result

The final Jenkins pipeline completed successfully. Terraform reported no infrastructure drift, OPA returned no policy violations, Checkov generated security scan evidence, and Grafana displayed live EC2 monitoring metrics.

## Conclusion

This project successfully demonstrates a full DevOps and DevSecOps workflow, from infrastructure provisioning to security validation, CI/CD automation, and observability.