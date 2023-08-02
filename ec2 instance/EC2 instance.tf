terraform {
    required_version = "1.3.9"
    required_providers{
      aws = {
      source = "hashicorp/aws"
      version = "~>5.6.0"
    }
    }     
  }

  provider "aws" {
    region = "us-east-1"
    profile = "default"    
  }

  resource "aws_instance" "Awsdomo" {
    ami = "ami-06b09bfacae1453cb"
    instance_type = "t2.micro"    
  }
