## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.61.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.61.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vm1"></a> [vm1](#module\_vm1) | ./modules/instance/ | n/a |
| <a name="module_vm2"></a> [vm2](#module\_vm2) | ./modules/instance/ | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_lb_network_load_balancer.nginx-load-balancer](https://registry.terraform.io/providers/yandex-cloud/yandex/0.61.0/docs/resources/lb_network_load_balancer) | resource |
| [yandex_lb_target_group.my-target-group](https://registry.terraform.io/providers/yandex-cloud/yandex/0.61.0/docs/resources/lb_target_group) | resource |
| [yandex_vpc_network.network](https://registry.terraform.io/providers/yandex-cloud/yandex/0.61.0/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.net-a](https://registry.terraform.io/providers/yandex-cloud/yandex/0.61.0/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.net-b](https://registry.terraform.io/providers/yandex-cloud/yandex/0.61.0/docs/resources/vpc_subnet) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address_lb"></a> [external\_ip\_address\_lb](#output\_external\_ip\_address\_lb) | external ip address loadbalancer |
| <a name="output_external_ip_address_vm1"></a> [external\_ip\_address\_vm1](#output\_external\_ip\_address\_vm1) | external ip address vm1 |
| <a name="output_external_ip_address_vm2"></a> [external\_ip\_address\_vm2](#output\_external\_ip\_address\_vm2) | external ip address vm2 |
| <a name="output_internal_ip_address_vm1"></a> [internal\_ip\_address\_vm1](#output\_internal\_ip\_address\_vm1) | internal ip address vm1 |
| <a name="output_internal_ip_address_vm2"></a> [internal\_ip\_address\_vm2](#output\_internal\_ip\_address\_vm2) | internal ip address vm2 |
