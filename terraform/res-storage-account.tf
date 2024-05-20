resource "azurerm_storage_account" "front_end_storage_account" {
  name     = "${var.unique_resource_id_prefix}frontendsa"
  location = "northeurope"

  account_replication_type = "LRS"
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  resource_group_name      = azurerm_resource_group.front_end_rg.name

  static_website {
    index_document = "index.html"
  }
}

resource "azurerm_storage_account" "products_service_fa" {
  name     = "${var.unique_resource_id_prefix}productssa"
  location = "northeurope"

  account_replication_type = "LRS"
  account_tier             = "Standard"
  account_kind             = "StorageV2"

  resource_group_name = azurerm_resource_group.product_service_rg.name
}

resource "azurerm_storage_account" "import_service_fa" {
  name     = "${var.unique_resource_id_prefix}importsa"
  location = "northeurope"

  account_replication_type = "LRS"
  account_tier             = "Standard"
  account_kind             = "StorageV2"

  resource_group_name = azurerm_resource_group.import_service_rg.name
}

resource "azurerm_storage_account" "import_service_files" {
  name     = "${var.unique_resource_id_prefix}importfilesa"
  location = "northeurope"

  account_replication_type = "LRS"
  account_tier             = "Standard"
  account_kind             = "StorageV2"

  blob_properties {
    cors_rule {
      allowed_headers    = ["*"]
      allowed_methods    = ["PUT", "GET"]
      allowed_origins    = ["*"]
      exposed_headers    = ["*"]
      max_age_in_seconds = 0
    }
  }

  resource_group_name = azurerm_resource_group.import_service_rg.name
}
