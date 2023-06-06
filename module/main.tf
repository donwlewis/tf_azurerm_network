provider "azurerm" {
  features {}
}

locals {
  var_subnets = { for subnet in var.subnets : subnet.name => {
    name                     = subnet.name
    address_prefixes         = subnet.address_prefixes
    service_endpoints        = subnet.service_endpoints
    private_endpoint_enabled = subnet.private_endpoint_enabled
    delegations              = subnet.delegations != null ? { for delegation in subnet.delegations : delegation.name => delegation } : {}
    }
  }
}

resource "azurerm_subnet" "sub" {
  for_each                                  = local.var_subnets
  name                                      = each.value.name
  resource_group_name                       = var.resource_group_name
  virtual_network_name                      = var.virtual_network_name
  private_endpoint_network_policies_enabled = each.value.private_endpoint_enabled
  address_prefixes                          = each.value.address_prefixes
  service_endpoints                         = each.value.service_endpoints

  dynamic "delegation" {
    for_each = each.value.delegations
    content {
      name = delegation.value.name

      service_delegation {
        name    = delegation.value.service_delegation_name
        actions = delegation.value.service_delegation_actions
      }
    }
  }
}
