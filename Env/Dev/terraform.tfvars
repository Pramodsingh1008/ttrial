rgs = {
    rg1 = {
        name = "myapp-dev-rg"
        location = "westus"
        env = "Dev"
        mb = "terraform"
    }
}

vnets = {
    Vnet_1 = {
        name = "vnet1"
       resource_group_name = "myapp-dev-rg"
        location = "westus"
        address_space = ["10.0.0.0/20"]

    }
}
sub = {
    sub1 = { 
        name = "frontend_subnet"
        virtual_network_name = "vnet1"
       resource_group_name = "myapp-dev-rg"
       address_prefixes = ["10.0.0.0/25"]

    }
}

nic = {
    nic1= {
        name = "nic_front"
        virtual_network_name = "vnet1"
        subnetname = "frontend_subnet"
       resource_group_name = "myapp-dev-rg"
         location = "westus"
         ip_configuration_name = "ip_1"
         nsgname = "nsgruleset"
         

    }
}
NSG = {
    NSG1 = {
        name = "nsgruleset"
        resource_group_name = "myapp-dev-rg"
        location = "westus"

    }
}

VM = {
    VM1= {
        name = "VFront"
        resource_group_name = "myapp-dev-rg"
        location = "westus"
        size = "Standard_B2pts_v2"
        admin_name = "vm123321"
        admin_password = "vm123321@" 
        nic_name = "nic_front"       
    }
}