variable "subnet_id" {
  description = "Digite a subnet: "
  validation {
    condition     = length(var.subnet_id) > 7 && substr(var.subnet_id, 0, 7) == "subnet-"
    error_message = "O valor do subnet_id não é válido, tem que começar com \"subnet-\"."
  }
}

variable "ami" {
  description = "Digite a AMI: "
  validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "O valor do ami não é válido, tem que começar com \"ami-\"."
  }

}

variable "tamanho" {
  description = "Digite o tamanho da maquina (large, micro...): "
  validation {
    condition     = length(var.tamanho) > 3 && substr(var.tamanho, 0, 3) == "t2."
    error_message = "O valor do tamanho não é válido, tem que começar com \"t2.\"."
  }

}

variable "qtd" {
  description = "Digite a quantidade de maquinas: "
}

variable "nome" {
  description = "Digite o nome da maquina: "
}