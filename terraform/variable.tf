variable "azure_client_id" {
  description = "The Client ID for the Azure Service Principal"
  type        = string
  validation {
    condition     = length(var.azure_client_id) > 0
    error_message = "The azure_client_id variable must not be empty."
  }
}

variable "azure_client_secret" {
  description = "The Client Secret for the Azure Service Principal"
  type        = string
  validation {
    condition     = length(var.azure_client_secret) > 0
    error_message = "The azure_client_secret variable must not be empty."
  }
}

variable "azure_subscription_id" {
  description = "The Subscription ID for the Azure account"
  type        = string
  validation {
    condition     = length(var.azure_subscription_id) > 0
    error_message = "The azure_subscription_id variable must not be empty."
  }
}

variable "azure_tenant_id" {
  description = "The Tenant ID for the Azure account"
  type        = string
  validation {
    condition     = length(var.azure_tenant_id) > 0
    error_message = "The azure_tenant_id variable must not be empty."
  }
}

variable "unique_resource_id_prefix" {
  description = "Prefix that is added to the resource names that are required to be unique (e.g. Storage Account names)"
  type        = string

  validation {
    condition     = length(var.unique_resource_id_prefix) == 12 && can(regex("^[a-zA-Z0-9]{12}$", var.unique_resource_id_prefix))
    error_message = "The unique_resource_id_prefix must be exactly 6 characters long. Only letters and numbers are allowed."
  }
}
