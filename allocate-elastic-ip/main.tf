resource "aws_eip" "datacenter_eip" {
  domain = "vpc"

  tags = {
    Name = "datacenter-eip"
  }
}
