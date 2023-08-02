variable "aws_region" {
    description = "region in which aws resources to be created"
    type = string
    default = "us-east-1"
  
}

variable "Instance_type" {
    description = "proving the instance type"
    type = string
    default = "t2.micro"  
}

/*
variable "Instance_type" {
    description = "proving the instance type"
    type = list(string)
    default = ["t2.micro", "t3.micro"]
}

variable "Instance_type_map" {
    description = "proving the instance type"
    type = map(string)
    default = {
        "dev" = "t2.micro"
        "pro" = "t3.micro"
    }    
}
*/
variable "instance_keypair" {
    description = "providing the key_pair"
    type = string
    default = "terraform_key"
    validation {
    condition = length(var.instance_keypair) > 2 || substr(var.instance_keypair, 0, 14) == "terraform_key"
    error_message = "The instance key pair must be at least 3 characters long or start with 'terraform_key'."
  }
}
