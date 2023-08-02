output "Instance_public_ip" {
    description = "Enter the public ip"
    #value = toset([for x in aws_instance.EC2_demo: x.public_ip])
    value = aws_instance.EC2_demo[*.public_ip]
}

output "Instance_public_dns" {
    description = "Enter the public ip"
    #value = toset([for x in aws_instance.EC2_demo: x.public_dns])  
}