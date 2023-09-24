virtual_machine = {

    windowsvm1 = {

    linuxvm_name = "linx-vm"
    public_ip = "win-pip"
    location = "eastus"
    nic_name = "win-nic"
    admin_username = "adminvinay"
    admin_password  =   "Vinay@123456"
    vm_size    =   "Standard_D2s_v3"


    }
        windowsvm2 = {

    linuxvm_name = "linx-vm2"
    public_ip = "win-pip2"
    location = "eastus"
    nic_name = "win-nic2"
    admin_username = "adminvinay"
    admin_password  =   "Vinay@123456"
    vm_size    =   "Standard_D2s_v3"
}
}

rgname = "rgcode1"
vnet = "codevnet2"
subnet_name = "codesunet1"