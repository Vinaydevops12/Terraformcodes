vnet_peering = {
  vnetpeer1 = {
    name = "vnet1-to-vnet2-peering"
    rgname           = "rgcode"
    vnet_name              = "codevnet1"
    vnetname_local  = "codevnet2"
    rgname_local    = "rgcode1"

  }
  vnetpeer2 = {
    name = "vnet2-to-vnet1-peering"
    rgname           = "rgcode1"
    vnet_name             = "codevnet2"
vnetname_local =    "codevnet1"
rgname_local    =   "rgcode"

  }

}