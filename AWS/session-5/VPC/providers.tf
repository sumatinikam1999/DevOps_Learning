terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket         = "awsbucket-terraform-new"
    key            = "foreach_demo/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamodb-lock"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}