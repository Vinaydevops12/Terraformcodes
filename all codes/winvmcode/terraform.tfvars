virtual_machine   =   {

  virtual_machine1 = {

    "nic_name"         = "winnic-card"
    "location"       = "eastus"
    "vm_name"         = "windowsvm"
    "size"           = "Standard_D2s_v3"
    "admin_username" = "adminvinay"
    "admin_password" = "Vinay@123456"
    "public_ip"       = "win-pip1"
    
    
  }



}

vnet = "codevnet1"
subnet_name = "codesunet2"
rgname        = "rgcode"

