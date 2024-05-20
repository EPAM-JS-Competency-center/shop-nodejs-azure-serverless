resource "azurerm_container_registry" "chatbot_acr" {
  name                = "${var.unique_resource_id_prefix}chatbotacr"
  resource_group_name = azurerm_resource_group.chatbot_rg.name
  location            = azurerm_resource_group.chatbot_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}
