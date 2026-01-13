variable "token" {}

variable "secrets" {
  default = {
    roboshop-dev = {
      description = "RobeShop App Component All secrets"
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

    catalogue = {
      secret = "roboshop-dev"
      value = {
        MONGO       = "true"
        MONGO_URL   = "mongodb://mongodb-dev.srikanth553.store:27017/catalogue"
        DB_TYPE     = "mongo"
        APP_GIT_URL = "https://github.com/roboshop-devops-project-v3/catalogue"
        DB_HOST     = "mongodb-dev.srikanth553.store"
      }
    }

    user = {
      secret = "roboshop-dev"
      value = {
        MONGO     = "true"
        REDIS_URL = "redis://redis-dev.srikanth553.store:6379"
        MONGO_URL = "mongodb://mongodb-dev.srikanth553.store:27017/users"
      }
    }

    shipping = {
      secret = "roboshop-dev"
      value = {
        CART_ENDPOINT = "cart:8080"
        DB_HOST       = "mysql-dev.srikanth553.store"
        DB_USER       = "root"
        DB_PASS       = "RoboShop@1"
        username      = "root"
        password      = "RoboShop@1"
        DB_TYPE       = "mysql"
        APP_GIT_URL   = "https://github.com/roboshop-devops-project-v3/shipping"
      }
    }

    payment = {
      secret = "roboshop-dev"
      value = {
        CART_HOST = "cart"
        CART_PORT = "8080"
        USER_HOST = "user"
        USER_PORT = "8080"
        AMQP_HOST = "rabbitmq-dev.srikanth553.store"
        AMQP_USER = "roboshop"
        AMQP_PASS = "roboshop123"
      }
    }

    frontend = {
      secret = "roboshop-dev"
      value = {
        catalogue_url  = "http://catalogue-dev.srikanth553.store:8080/"
        user_url       = "http://user-dev.srikanth553.store:8080/"
        cart_url       = "http://cart-dev.srikanth553.store:8080/"
        payment_url    = "http://payment-dev.srikanth553.store:8080/"
        shipping_url   = "http://shipping-dev.srikanth553.store:8080/"
        CATALOGUE_HOST = "catalogue"
        CATALOGUE_PORT = 8080
        USER_HOST      = "user"
        USER_PORT      = 8080
        CART_HOST      = "cart"
        CART_PORT      = 8080
        SHIPPING_HOST  = "shipping"
        SHIPPING_PORT  = 8080
        PAYMENT_HOST   = "payment"
        PAYMENT_PORT   = 8080


      }
    }

    rabbitmq = {
      secret = "roboshop-dev"
      value = {
        username = "roboshop"
        password = "roboshop123"
      }
    }

    mysql = {
      secret = "roboshop-dev"
      value = {
        username = "root"
        password = "RoboShop@1"
      }
    }


 ssh = {
      secret = "roboshop-infra"
      value = {
        username = "azureuser"
        password = "DevOps@123456"
      }
    }
}
}