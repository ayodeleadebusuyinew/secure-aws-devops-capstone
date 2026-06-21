output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.capstone_server.id
}

output "public_ip" {
  description = "EC2 public IP"
  value       = aws_instance.capstone_server.public_ip
}

output "public_dns" {
  description = "EC2 public DNS"
  value       = aws_instance.capstone_server.public_dns
}