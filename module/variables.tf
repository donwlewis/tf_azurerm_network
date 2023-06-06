variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network."
}

variable "subnets" {
  type = list(object({
    name                     = string
    address_prefixes         = list(string)
    service_endpoints        = optional(list(string), null)
    private_endpoint_enabled = optional(bool, false)
    delegations = optional(list(object({
      name                       = optional(string)
      service_delegation_name    = optional(string)
      service_delegation_actions = optional(list(string))
    })), null)
  }))
  description = "Subnets you want to create."
}
