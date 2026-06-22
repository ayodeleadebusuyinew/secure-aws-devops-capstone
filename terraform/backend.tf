terraform {
  backend "s3" {
    bucket  = "secure-devops-capstone-tfstate-250121276217-us-east-1"
    key     = "secure-aws-devops-capstone/dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
