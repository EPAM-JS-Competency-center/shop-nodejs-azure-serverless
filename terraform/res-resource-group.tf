resource "azurerm_resource_group" "service_bus" {
  location = "northeurope"
  name     = "${var.unique_resource_id_prefix}-rg-sb-integration-ne-001"
}

resource "azurerm_resource_group" "import_service_rg" {
  location = "northeurope"
  name     = "${var.unique_resource_id_prefix}-rg-import-service-sand-ne-001"
}

resource "azurerm_resource_group" "front_end_rg" {
  name     = "${var.unique_resource_id_prefix}-rg-frontend-sand-ne-001"
  location = "northeurope"
}

resource "azurerm_resource_group" "apim" {
  location = "northeurope"
  name     = "${var.unique_resource_id_prefix}-rg-apim-sand-ne-001"
}

resource "azurerm_resource_group" "product_service_rg" {
  location = "northeurope"
  name     = "${var.unique_resource_id_prefix}-rg-product-service-sand-ne-001"
}

resource "azurerm_resource_group" "chatbot_rg" {
  name     = "${var.unique_resource_id_prefix}-rg-chatbot"
  location = "West Europe"
}
