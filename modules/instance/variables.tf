// Имя образа для поиска
variable "instance_family_image" {
  description = "Instance image"
  type        = string
  default     = "lamp"
}
// Создаем перемнную для подсети, так как подсетей требуется две
variable "vpc_subnet_id" {
  description = "VPC subnet network id"
  type        = string
}

variable "instance_zone" {
  description = "instance zone"
  type        = string
}
