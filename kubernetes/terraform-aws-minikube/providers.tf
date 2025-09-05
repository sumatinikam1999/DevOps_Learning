terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-mini"
    key            = "module"
    region         = "us-east-1"
    dynamodb_table = "Dynamodb"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}