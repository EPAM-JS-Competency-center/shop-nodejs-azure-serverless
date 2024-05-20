resource "azurerm_app_configuration" "products_config" {
  location            = "northeurope"
  name                = "${var.unique_resource_id_prefix}-products-sand-ne-001"
  resource_group_name = azurerm_resource_group.product_service_rg.name

  sku = "free"
}
