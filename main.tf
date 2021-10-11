provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "web" {
  ami           = "ami-09e67e426f25ce0d7" #ami ubuntu 20
  instance_type = "t3.micro"
  vpc_security_group_ids = ["vpc-063fc945cde94d3ab"] #vpc Julia

  tags = {
    Name = "MaquinaTerraformJulia"
  }
}
