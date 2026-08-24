module "rg" {
  source = "../../Modules/Azure_RG"
  rgs = var.rgs
}
module "vnets" {
  source = "../../Modules/Azure_Vnet"
  vnets = var.vnets
  depends_on = [ module.rg ]
}
module "subnet" {
  source = "../../Modules/Azure_Subnet"
  sub = var.sub
  depends_on = [ module.vnets ]
}
module "nic" {
  source = "../../Modules/azure_NIC"
  nic = var.nic
  depends_on = [ module.subnet ]
}
module "NSG" {
  source = "../../Modules/Azure_NSG"
  NSG = var.NSG
  depends_on = [ module.rg ]
}
module "vm" {
  source = "../../Modules/Azure_VM"
  VM = var.VM
  depends_on = [ module.NSG ]
}