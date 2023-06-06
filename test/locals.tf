locals {
  subnets = [
    {
      name                     = "curlybill"
      address_prefixes         = ["10.0.0.0/24"]
      private_endpoint_enabled = true
    },
    {
      name              = "wyattearp"
      address_prefixes  = ["10.0.1.0/24"]
      service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage"]
    },
    {
      name              = "docholiday"
      address_prefixes  = ["10.0.2.0/24"]
      service_endpoints = ["Microsoft.KeyVault"]
      delegations = [{
        name                       = "appsvc"
        service_delegation_name    = "Microsoft.Web/serverFarms"
        service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }]
    }
  ]
}
