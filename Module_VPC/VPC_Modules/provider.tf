terraform {
    #required_version = "1.3.9"
    required_providers{
      aws = {
      source = "hashicorp/aws"
      version = "~>5.6.0"
    }
    }     
  }

  provider "aws" {
    region = var.aws_region
    profile = "default"    
  }