provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "web" {
  subnet_id     = var.subnet_id
  ami           = var.ami
  instance_type = var.tamanho
  count = var.qtd
  key_name = "chave_development_julia"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_julia.id}"]
  root_block_device {
    encrypted   = true
    #kms_key_id  = "arn:aws:kms:us-east-1:534566538491:key/90847cc8-47e8-4a75-8a69-2dae39f0cc0d" #key managment service (aws) -> awsmanaged keys -> aws/ebs -> copy arn
    volume_size = 8
  }
  tags = {
    Name = "${var.nome}-${count.index+1}"
  }
}