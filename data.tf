data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # usuario padrao pra encontrar as imagens
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-*"]
  }
}