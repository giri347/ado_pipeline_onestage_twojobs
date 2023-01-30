
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "9906489f-5645-44c1-a338-e48a8a7a21ba"
 tenant_id = "b8c5386e-89b6-4572-be68-192298b572cf"
 client_id = "f428b9fa-18b7-4756-82ea-35bcfb0a1d1b"
 client_secret = "FrE8Q~dNnSG9SoN0VPKZYElh6D2MvG4WvB~xocOQ"
  features {}
}

resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "North Europe"
}

