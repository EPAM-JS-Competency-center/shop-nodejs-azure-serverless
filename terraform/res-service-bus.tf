resource "azurerm_servicebus_namespace" "integration_sb" {
  location            = "northeurope"
  name                = "${var.unique_resource_id_prefix}-sb-integration-ne-001"
  resource_group_name = azurerm_resource_group.service_bus.name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "products_import" {
  name         = "products-import"
  namespace_id = azurerm_servicebus_namespace.integration_sb.id
}
