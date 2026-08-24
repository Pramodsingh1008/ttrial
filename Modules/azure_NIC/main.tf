resource "azurerm_network_interface" "nicblk" {
    for_each = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.subdata[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_subnet_network_security_group_association" "NSGAssocblk" {
  for_each = var.nic
  subnet_id                 = data.azurerm_subnet.subdata[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsgdata[each.key].id
}
