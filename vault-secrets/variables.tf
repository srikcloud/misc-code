variable "token" {}

variable "secrets" {
  default = {
    roboshop-dev = {
        description = "Roboshop App Components All secrets"
    }
    roboshop-infra = {
      description = "Roboshop Infra related secrets"
    }
}
}

variable "values" {
  default = {
    cart = {
      secret = "roboshop-dev"
      value = {
        REDIS_HOST     = "redis-dev.srikanth553.store"
        CATALOGUE_HOST = "catalogue"
        CATALOGUE_PORT = 8080
      }
    }
  }
  }