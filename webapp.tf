
resource "azurerm_app_service_plan" "einfoplan" {
  name                = "einfoplan-appserviceplan"
  location            = azurerm_resource_group.appgrp.location
  resource_group_name = azurerm_resource_group.appgrp.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

#resource "azurerm_app_service" "einfowebapp" {
#count               = 2
#name                = "einfo-webapp${count.index + 1}"
#location            = azurerm_resource_group.appgrp.location
##resource_group_name = azurerm_resource_group.appgrp.name
#app_service_plan_id = azurerm_app_service_plan.einfoplan.id
resource "azurerm_app_service" "einfowebapp" {
  for_each            = toset(["einfodevwebapp", "einfoprowebapp"])
  name                = each.key
  location            = azurerm_resource_group.appgrp.location
  resource_group_name = azurerm_resource_group.appgrp.name
  app_service_plan_id = azurerm_app_service_plan.einfoplan.id


  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}
