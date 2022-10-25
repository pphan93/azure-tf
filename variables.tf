#-----------------------------provider-----------#

variable "sub_id" {
}

variable "client_id" {
}

variable "client_secret" {
}

variable "tenant_id" {
}



#---------------vnet-------------
variable "vnet_name" {
    type = list
    default = ["VNet-A-CanadaCentral", "VNet-A-CanadaEast", "VNet-B-CanadaEast"]
  
}

variable "vnet_location" {
    type = list
    default = ["Canada Central", "Canada East", "Canada East"]
  
}

variable "vnet_addr_space" {
    type = list
    default = ["10.3.0.0/16", "10.4.0.0/16", "10.5.0.0/16"]
  
}

variable "vnet_addr_prefix" {
    type = list
    default = ["10.3.0.0/24", "10.4.0.0/24", "10.5.0.0/24"]
  
}

#-------------------backend_ignore_not_allow_---------------#
variable "organization" {
  type = string
}

variable "org_workspace" {
  type = string
}

#-------------------vm----------------#
variable "vm_username" {
  type = string
}

variable "vm_password" {
  type = string
}