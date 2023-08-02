/*
data "aws_ec2_instance_type_offerings" "offer_instance" {
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }

  filter {
    name   = "location"
    values = ["us-east-1a"]
  }

  location_type = "availability-zone"
}
*/

data "aws_ec2_instance_type_offerings" "offer_instance2" {
    for_each = toset(["us-east-1a","us-east-1b", "us-east-1c","us-east-1d","us-east-1e"])
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

output "instance_type_offerings"{
    description = "enter the availaility_zone-"
    #value = data.aws_ec2_instance_type_offerings.offer_instance.instance_types
    value = [for x in data.aws_ec2_instance_type_offerings.offer_instance2: x.instance_types]
}

output "instance_type_offerings1"{
    description = "enter the availaility_zone-"
    value = {
        for x, y in data.aws_ec2_instance_type_offerings.offer_instance2: x=> y.instance_types
    }
}

/* output "instance_type_offerings1"{
    description = "enter the availaility_zone-"
    value = data.aws_ec2_instance_type_offerings.offer_instance.location_types
}
output "instance_type_offerings"{
    description = "enter the availaility_zone-"
    value = data.aws_ec2_instance_type_offerings.offer_instance.locations
    
}
*/
  

# Determine which Availability Zones support your instance type
# aws ec2 describe-instance-type-offerings --location-type availability-zone  --filters Name=instance-type,Values=t3.micro --region us-east-1 --output table