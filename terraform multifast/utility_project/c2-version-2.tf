data "aws_availability_zones" "my_zones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_ec2_instance_type_offerings" "offer_instance22" {
  for_each = toset(data.aws_availability_zones.my_zones.names)
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"

}

output "instance_type_offerings222" {
    description = "enter the availaility_zone-"
    #value = data.aws_ec2_instance_type_offerings.offer_instance.instance_types
    value = [for x in data.aws_ec2_instance_type_offerings.offer_instance22: x.instance_types]
}
output "instance_type_offerings2"{
    description = "enter the availaility_zone-"
       value = {
        for x, y in data.aws_ec2_instance_type_offerings.offer_instance22: x=> y.instance_types if length(y.instance_types) != 0
        }
}
