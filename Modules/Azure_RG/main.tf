resource "azurerm_resource_group" "Rgblk" {
  for_each = var.rgs
  name = each.value.name
  location = each.value.location
  tags = {
    envrn = each.value.env
    modifiedby = each.value.mb
  }
}