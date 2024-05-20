resource "azurerm_api_management" "core_apim" {
  location        = "northeurope"
  name            = "${var.unique_resource_id_prefix}-apim-sand-ne-001"
  publisher_email = "mail@example.com"
  publisher_name  = "John Doe"

  resource_group_name = azurerm_resource_group.apim.name
  sku_name            = "Consumption_0"
}

resource "azurerm_api_management_api_policy" "import_api_policy" {
  api_management_name = azurerm_api_management.core_apim.name
  api_name            = azurerm_api_management_api.import_api.name
  resource_group_name = azurerm_resource_group.apim.name

  xml_content = <<XML
 <policies>
 	<inbound>
 		<set-backend-service backend-id="${azurerm_api_management_backend.import_fa.name}"/>
 		<base/>
 	</inbound>
 	<backend>
 		<base/>
 	</backend>
 	<outbound>
 		<base/>
 	</outbound>
 	<on-error>
 		<base/>
 	</on-error>
 </policies>
XML
}

resource "azurerm_api_management_backend" "import_fa" {
  name                = "import-service-backend"
  resource_group_name = azurerm_resource_group.apim.name
  api_management_name = azurerm_api_management.core_apim.name
  protocol            = "http"
  url                 = "https://${azurerm_windows_function_app.import_service.name}.azurewebsites.net/api"
  description         = "Import API"

  credentials {
    certificate = []
    query       = {}

    header = {
      "x-functions-key" = data.azurerm_function_app_host_keys.import_keys.default_function_key
    }
  }
}

resource "azurerm_api_management_api" "import_api" {
  api_management_name = azurerm_api_management.core_apim.name
  name                = "import-service-api"
  resource_group_name = azurerm_resource_group.apim.name
  revision            = "1"
  path                = "import-service"

  display_name = "Import Service API"

  protocols = ["https"]
}

resource "azurerm_api_management_api" "products_api" {
  api_management_name = azurerm_api_management.core_apim.name
  name                = "products-service-api"
  resource_group_name = azurerm_resource_group.apim.name
  revision            = "1"
  path                = "products-service"

  display_name = "Products Service API"

  protocols = ["https"]
}

resource "azurerm_api_management_api_operation" "import_file" {
  api_management_name = azurerm_api_management.core_apim.name
  api_name            = azurerm_api_management_api.import_api.name
  display_name        = "Import Products"
  method              = "GET"
  operation_id        = "get-import-url"
  resource_group_name = azurerm_resource_group.apim.name
  url_template        = "/import"

  request {
    query_parameter {
      name     = "name"
      required = true
      type     = "string"
    }
  }
}

resource "azurerm_api_management_backend" "products_fa" {
  name                = "products-service-backend"
  resource_group_name = azurerm_resource_group.apim.name
  api_management_name = azurerm_api_management.core_apim.name
  protocol            = "http"
  url                 = "https://${azurerm_windows_function_app.products_service.name}.azurewebsites.net/api"
  description         = "Products API"

  credentials {
    certificate = []
    query       = {}

    header = {
      "x-functions-key" = data.azurerm_function_app_host_keys.products_keys.default_function_key
    }
  }
}

resource "azurerm_api_management_api_policy" "api_policy" {
  api_management_name = azurerm_api_management.core_apim.name
  api_name            = azurerm_api_management_api.products_api.name
  resource_group_name = azurerm_resource_group.apim.name

  xml_content = <<XML
 <policies>
 	<inbound>
 		<set-backend-service backend-id="${azurerm_api_management_backend.products_fa.name}"/>
 		<base/>
 	</inbound>
 	<backend>
 		<base/>
 	</backend>
 	<outbound>
 		<base/>
 	</outbound>
 	<on-error>
 		<base/>
 	</on-error>
 </policies>
XML
}

resource "azurerm_api_management_api_operation" "get_products" {
  api_management_name = azurerm_api_management.core_apim.name
  api_name            = azurerm_api_management_api.products_api.name
  display_name        = "Get Products"
  method              = "GET"
  operation_id        = "get-products"
  resource_group_name = azurerm_resource_group.apim.name
  url_template        = "/products"
}

resource "azurerm_api_management_api_operation" "get_product_by_id" {
  api_management_name = azurerm_api_management.core_apim.name
  api_name            = azurerm_api_management_api.products_api.name
  display_name        = "Get Product by ID"
  method              = "GET"
  operation_id        = "get-product-by-id"
  resource_group_name = azurerm_resource_group.apim.name
  url_template        = "/products/{id}"

  template_parameter {
    name     = "id"
    required = true
    type     = "string"
  }
}
