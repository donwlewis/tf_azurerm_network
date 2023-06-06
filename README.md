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

## Local Data Manipulation

```terraform
local_subnets = {
  "curlybill" = {
    "address_prefixes" = tolist([
      "10.0.0.0/24",
    ])
    "delegations" = {}
    "name" = "curlybill"
    "private_endpoint_enabled" = true
    "service_endpoints" = tolist(null) /* of string */
  }
  "docholiday" = {
    "address_prefixes" = tolist([
      "10.0.2.0/24",
    ])
    "delegations" = tomap({
      "appsvc" = {
        "name" = "appsvc"
        "service_delegation_actions" = tolist([
          "Microsoft.Network/virtualNetworks/subnets/action",
        ])
        "service_delegation_name" = "Microsoft.Web/serverFarms"
      }
    })
    "name" = "docholiday"
    "private_endpoint_enabled" = false
    "service_endpoints" = tolist([
      "Microsoft.KeyVault",
    ])
  }
  "wyattearp" = {
    "address_prefixes" = tolist([
      "10.0.1.0/24",
    ])
    "delegations" = {}
    "name" = "wyattearp"
    "private_endpoint_enabled" = false
    "service_endpoints" = tolist([
      "Microsoft.KeyVault",
      "Microsoft.Storage",
    ])
  }
}
```