terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

// Ищем образ. Family берется из переменной
data "yandex_compute_image" "image-attrs" {
    family = var.instance_family_image
}

// Делаем шаблон машины
resource "yandex_compute_instance" "vm" {
    name = "terraform-${var.instance_family_image}"
    zone = var.instance_zone

    resources {
        cores = 2
        memory = 2
    }

    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.image-attrs.id
        }
    }

    network_interface {
        subnet_id = var.vpc_subnet_id
        nat = true //Выдаем белый IP
    }

    metadata = {
        ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
}
