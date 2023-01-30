resource "azurerm_storage_account" "appstore151694" {
  name                     = "appstore151694"
  resource_group_name      = "app-grp"
  location                 = "North Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  depends_on = [
    azurerm_resource_group.appgrp
  ]



}

resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_name  = "appstore151694"
  container_access_type = "blob"
  depends_on = [
    azurerm_storage_account.appstore151694
  ]
}

resource "azurerm_storage_blob" "blobinfo" {
  name                   = "einfo"
  storage_account_name   = "appstore151694"
  storage_container_name = "data"
  type                   = "Block"
  source                 = "main.tf"
  depends_on = [
    azurerm_storage_container.data
  ]
}