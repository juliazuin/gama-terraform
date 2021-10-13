resource "aws_security_group" "allow_ssh_julia" {
  name        = "allow_ssh_julia"
  description = "Permitir conexão ssh"
  vpc_id      = " vpc-063fc945cde94d3ab"

  ingress = [
    {
      description      = "Liberando ssh inbound"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]

  tags = {
    Name = "allow_ssh_julia"
  }
}
