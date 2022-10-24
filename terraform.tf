terraform {
  required_version = ">= 0.12"
  backend "remote" {
    organization = "pphan93"
    workspaces {
      name = "azure-state"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.26.0"
    }
  }
}

