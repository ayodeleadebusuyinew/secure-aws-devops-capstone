package terraform.security

deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "aws_security_group"
  ingress := resource.change.after.ingress[_]
  ingress.from_port == 22
  ingress.cidr_blocks[_] == "0.0.0.0/0"
  msg := "Security violation: SSH access from 0.0.0.0/0 is not allowed."
}

deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "aws_security_group"
  ingress := resource.change.after.ingress[_]
  ingress.from_port == 80
  ingress.cidr_blocks[_] == "0.0.0.0/0"
  msg := "Security violation: HTTP access from 0.0.0.0/0 is not allowed in this capstone lab."
}

deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  resource.change.after.monitoring == false
  msg := "Security violation: EC2 detailed monitoring must be enabled."
}

deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  block := resource.change.after.root_block_device[_]
  block.encrypted == false
  msg := "Security violation: EC2 root volume must be encrypted."
}

deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  not resource.change.after.metadata_options[0].http_tokens == "required"
  msg := "Security violation: EC2 instance must enforce IMDSv2."
}
