resource "aws_security_group" "allow-ssh-julia" {
  name        = "allow-ssh-julia"
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
      prefix_list_ids  = null,
      security_groups  = null,
      self             = null
      description      = "liberando porta interna"
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups  = null,
      self             = null
      description      = "liberando porta interna"
    }
  ]

  tags = {
    Name = "allow-ssh-julia"
  }
}
