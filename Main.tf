terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "skillfactory-tf-state-bucket-mentor"
    region     = "ru-central1-a"
    key        = "./terraform.tfstate"
    access_key = "string"
    secret_key = "string"

    skip_region_validation      = true
    skip_credentials_validation = true
  }

}

provider "yandex" {
  token     = "string"
  cloud_id  = "string"
  folder_id = "string"
  zone      = "ru-central1-a"
}

// Создаем сеть
resource "yandex_vpc_network" "network" {
  name = "network"
}
// Создаем подсети
resource "yandex_vpc_subnet" "net-a" {
  name           = "net-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.2.0.0/16"]
}

resource "yandex_vpc_subnet" "net-b" {
  name           = "net-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.3.0.0/16"]
}
module "vm1" {
  source                = "./modules/instance/"
  instance_family_image = "lamp"

  // vpc_subnet_id - переменная модуля
  vpc_subnet_id = yandex_vpc_subnet.net-a.id
  instance_zone = "ru-central1-a"

}

module "vm2" {
  source                = "./modules/instance/"
  instance_family_image = "lemp"
  vpc_subnet_id         = yandex_vpc_subnet.net-b.id
  instance_zone         = "ru-central1-b"

}

//Cоздаем target group

resource "yandex_lb_target_group" "my-target-group" {
  name = "my-target-group"

  target {
    subnet_id = yandex_vpc_subnet.net-a.id
    address   = module.vm1.internal_ip_address_vm
  }

  target {
    subnet_id = yandex_vpc_subnet.net-b.id
    address   = module.vm2.internal_ip_address_vm
  }
}

resource "yandex_lb_network_load_balancer" "nginx-load-balancer" {
  name = "my-network-load-balancer"

  listener {
    name        = "my-listener"
    port        = 8080
    target_port = "80"
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.my-target-group.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
      }
    }
  }
}

data "yandex_lb_network_load_balancer" "nginx-load-balancer" {
  network_load_balancer_id = "nginx-load-balancer"
}