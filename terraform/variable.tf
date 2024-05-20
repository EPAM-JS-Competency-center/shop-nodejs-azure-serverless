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

variable "docker_hub_username" {
  description = "The Username for the Docker Hub"
  type        = string
  validation {
    condition     = length(var.docker_hub_username) > 0
    error_message = "The docker_hub_username variable must not be empty."
  }
}

variable "docker_hub_password" {
  description = "The Password for the Docker Hub"
  type        = string
  validation {
    condition     = length(var.docker_hub_password) > 0
    error_message = "The docker_hub_password variable must not be empty."
  }
}

variable "docker_hub_registry_name" {
  description = "The your personal registry name from the Docker Hub"
  type        = string
  validation {
    condition     = length(var.docker_hub_registry_name) > 0
    error_message = "The docker_hub_registry_name variable must not be empty."
  }
}

variable "chatbot_container_name" {
  description = "The container name from your personal registry on the Docker Hub or Azure Container Registry"
  type        = string
  default     = "hello-world-app"
  validation {
    condition     = length(var.chatbot_container_name) > 0
    error_message = "The chatbot_container_name variable must not be empty."
  }
}

variable "chatbot_container_tag_dh" {
  description = "The container tag for your container from your personal registry on the Docker Hub"
  type        = string
  default     = "latest"
  validation {
    condition     = length(var.chatbot_container_tag_dh) > 0
    error_message = "The chatbot_container_tag_dh variable must not be empty."
  }
}

variable "chatbot_container_tag_acr" {
  description = "The container tag for your container from your personal registry on Azure Container Registry"
  type        = string
  default     = "v1"
  validation {
    condition     = length(var.chatbot_container_tag_acr) > 0
    error_message = "The chatbot_container_tag_acr variable must not be empty."
  }
}
