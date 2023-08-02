# creating the availability zone

data "aws_availability_zones" "my_zones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


# ec2 instance:

resource "aws_instance" "EC2_demo"{
    ami = data.aws_ami.Linux_images.id
    instance_type = var.Instance_type
    #instance_type = var.Instance_type_map["dev"]
    user_data = file("${path.module}/appinstall.sh")
    key_name = var.instance_keypair
    vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
    for_each = toset(data.aws_availability_zones.my_zones.names)    
    availability_zone = each.key
    #count = 2
    tags = {
    "Name" = "EC2 Demo 2 ${each.value}"      
}
}