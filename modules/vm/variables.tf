variable "item_count" {
  type = number
  description = "Number of item to get create"
}

variable "nic_name" {
  type = list
}

variable "location" {
  type = list
}

variable "rg_name" {
  type = string
}

variable "vm_username" {
  type = string
}

variable "vm_password" {
  type = string
}

variable "subnet_id" {
  type = list
}