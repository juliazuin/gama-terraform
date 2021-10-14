resource "aws_rds_cluster" "juliaDB" {
  cluster_identifier   = "juliaDB"
  db_subnet_group_name = aws_db_subnet_group.juliaDB.name
  engine_mode          = "multimaster"
  master_password      = "root1234"
  master_username      = "root"
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "mmotadb" {
  name       = "main"
  subnet_ids = ["subnet-0007a339f445fd616", "subnet-0a7ce1b942558345a"] # trocar pelas minhas subnets depois
  tags = {
    Name = "Subnet aurora group"
  }
}
