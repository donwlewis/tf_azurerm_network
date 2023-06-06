# tf_azurerm_network

Terraform module for working with Azure network services.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.sub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets you want to create. | <pre>list(object({<br>    name                     = string<br>    address_prefixes         = list(string)<br>    service_endpoints        = optional(list(string), null)<br>    private_endpoint_enabled = optional(bool, false)<br>    delegations = optional(list(object({<br>      name                       = optional(string)<br>      service_delegation_name    = optional(string)<br>      service_delegation_actions = optional(list(string))<br>    })), null)<br>  }))</pre> | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Name of the virtual network. | `string` | n/a | yes |      

## Outputs

No outputs.