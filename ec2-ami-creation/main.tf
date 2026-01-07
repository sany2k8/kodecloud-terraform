# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-24b109e3011f2b2cc"
  ]

  tags = {
    Name = "xfusion-ec2"
  }
}

# Create AMI from the existing EC2 instance
resource "aws_ami_from_instance" "xfusion_ec2_ami" {
  name               = "xfusion-ec2-ami"
  source_instance_id = aws_instance.ec2.id

  wait_for_ami = true

  tags = {
    Name = "xfusion-ec2-ami"
  }
}
