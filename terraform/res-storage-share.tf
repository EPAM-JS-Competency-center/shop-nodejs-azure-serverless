resource "azurerm_storage_share" "import_service_fa" {
  name  = "fa-import-service-share"
  quota = 2

  storage_account_name = azurerm_storage_account.import_service_fa.name
}

resource "azurerm_storage_share" "products_service_fa" {
  name  = "fa-products-service-share"
  quota = 2

  storage_account_name = azurerm_storage_account.products_service_fa.name
}
