provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t3.micro"
  key_name                = "chave_development_julia" # key chave publica cadastrada na AWS 
  subnet_id               =  aws_subnet.my_subnet.id # vincula a subnet direto e gera o IP automático
  private_ip              = "10.10.10.100"
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform.id}",
  ]
  root_block_device {
    encrypted = true
    kms_key_id  = "arn:aws:kms:us-east-1:534566538491:key/90847cc8-47e8-4a75-8a69-2dae39f0cc0d" #key managment service (aws) -> awsmanaged keys -> aws/ebs -> copy arn
    # volume_size = 8
  }

  tags = {
    Name = "ec2_tf_Julia"
  }
}

resource "aws_eip" "example" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.example.id
}

# terraform refresh para mostrar o ssh

output "aws_instance_e_ssh" {
  value = [
    aws_instance.web.public_ip,
    "ssh -i id_rsa_itau_treinamento ubuntu@${aws_instance.web.public_dns}"
  ]
}