terraform {
  backend "s3" {
    bucket = "gitlabami-state-tf"#"<state_aws_storage_bucket_name>"
    key    = "ami.tfstate"
    region = "sa-east-1"#"<aws_region>"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  #profile = "gitlabamipoc"
}
