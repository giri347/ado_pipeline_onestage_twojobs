resource "azurerm_storage_account" "einfoappstore151694" {
  name                     = "einfoappstore151694"
  resource_group_name      = var.azurerm_resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  depends_on = [
    var.azurerm_resource_group
  ]
  tags = var.tags

}

resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_name  = "einfoappstore151694"
  container_access_type = "blob"
  depends_on = [
    azurerm_storage_account.einfoappstore151694
  ]
}

resource "azurerm_storage_blob" "blobinfo" {
  name                   = "einfo"
  storage_account_name   = "einfoappstore151694"
  storage_container_name = "data"
  type                   = "Block"
  source                 = "main.tf"
  depends_on = [
    azurerm_storage_container.data
  ]
}