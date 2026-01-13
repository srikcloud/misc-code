variable "token" {}

variable "secrets" {
  default = {
    roboshop-dev = {
        description = "Roboshop App Components All secrets"
    }
  }
}

