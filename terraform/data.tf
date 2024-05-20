data "azurerm_function_app_host_keys" "products_keys" {
  name                = azurerm_windows_function_app.products_service.name
  resource_group_name = azurerm_resource_group.product_service_rg.name
}

data "azurerm_function_app_host_keys" "import_keys" {
  name                = azurerm_windows_function_app.import_service.name
  resource_group_name = azurerm_resource_group.import_service_rg.name
}
