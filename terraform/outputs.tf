output "app_server_instance_id" {
  description = "Application server instance ID"
  value       = module.ec2.instance_id
}

output "app_server_public_ip" {
  description = "Application server public IP"
  value       = module.ec2.public_ip
}

output "app_server_public_dns" {
  description = "Application server public DNS"
  value       = module.ec2.public_dns
}