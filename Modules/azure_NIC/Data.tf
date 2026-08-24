data "azurerm_subnet" "subdata" {
    for_each = var.nic
  name                 = each.value.subnetname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
  
    }

    data "azurerm_network_security_group" "nsgdata" {
      for_each = var.nic
  name                = each.value.nsgname
  resource_group_name = each.value.resource_group_name
}
