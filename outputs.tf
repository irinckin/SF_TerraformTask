output "internal_ip_address_vm1" {
  description = "internal ip address vm1"
  value = module.vm1.internal_ip_address_vm
}

output "external_ip_address_vm1" {
  description = "external ip address vm1"
  value = module.vm1.external_ip_address_vm
}

output "internal_ip_address_vm2" {
  description = "internal ip address vm2"
  value = module.vm2.internal_ip_address_vm
}

output "external_ip_address_vm2" {
  description = "external ip address vm2"
  value = module.vm2.external_ip_address_vm
}

output "external_ip_address_lb" {
  description = "external ip address loadbalancer"
  value = one(one(yandex_lb_network_load_balancer.nginx-load-balancer.listener).external_address_spec).address
}
