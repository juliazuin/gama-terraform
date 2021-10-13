provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = "subnet-05880ea9006199004"

  root_block_device {
    volume_size = 8
    encrypted   = true
    kms_key_id  = "7f780024-d5c0-4c59-a9b7-99d5b16578ca"
  }

  tags = {
    Name = "MinhaPrimeiraEC2_Julia"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-*"]
  }
}

#subnet-05880ea9006199004
# Terraform v1.0.8

