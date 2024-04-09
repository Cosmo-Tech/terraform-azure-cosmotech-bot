variable "resource_group" {
  type        = string
  description = "The name of the resource group to deploy the resources"
}

variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID"
}

variable "client_id" {
  type        = string
  description = "The client ID of the service principal used to authenticate with Azure. Press <ENTER> to skip and use your own identity."
}

variable "client_secret" {
  type        = string
  description = "The client secret of the service principal used to authenticate with Azure. Press <ENTER> to skip and use your own identity."
}

variable "storage_account_access_key" {
  type        = string
  description = "The access key of the storage account"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account"
}

variable "embeddings_deployment_name" {
  type        = string
  description = "The name of the deployment for the embeddings model. See the documentation for more information: https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/models"
  default     = "text-embedding-ada-002"
}

variable "llm_deployment_name" {
  type        = string
  description = "The name of the deployment for the LLM model. See the documentation for more information: https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/models"
  default     = "gpt-4"
}

variable "tenant_id" {
  type        = string
  description = "The tenant ID of the service principal / User used to authenticate with Azure"
}

variable "kusto_cluster_url" {
  type        = string
  description = "The URL of the Kusto cluster to connect to"
}

variable "kusto_database" {
  type        = string
  description = "The name of the Kusto database to connect to"
}

variable "platform_app_registration_id" {
  type        = string
  description = "The Client ID of the app registration of the platform app"
}

variable "platform_app_registration_secret" {
  type        = string
  description = "The Client Secret of the app registration of the platform app"
}

variable "context_file_path" {
  type        = string
  description = "The path to the context file"
}

variable "is_vector_store_local" {
  type        = string
  description = "Whether the vector store is local or not"
  default     = "false"
}

variable "enable_oryx_build" {
  type        = string
  description = "Enable the Oryx build"
  default     = "true"
}

variable "scm_do_build_during_deployment" {
  type        = string
  description = "Enable the build during deployment"
  default     = "true"
}

variable "websites_enable_app_service_storage" {
  type        = string
  description = "Enable the app service storage"
  default     = "false"
}

variable "index_name" {
  type        = string
  description = "The name of the index"
}

variable "retrieved_document_nb" {
  type        = string
  description = "The number of documents to retrieve from the search service"
}

variable "azure_open_ai_api_type" {
  type        = string
  description = "The type of the Azure Open AI service"
  default     = "azure"
}

variable "azure_open_ai_api_version" {
  type        = string
  description = "The version of the Azure Open AI API service"
  default     = "2023-10-01-preview"
}

variable "temperature" {
  type        = string
  description = "value of the temperature parameter"
  default     = "0.2"
}

variable "max_token" {
  type        = number
  description = "The value of the max_token parameter"
  default     = 4096
}

variable "streaming" {
  type        = bool
  description = "Wether to enable streaming or not"
  default     = false
}

variable "streaming_step" {
  type        = number
  description = "value of the streaming step parameter"
  default     = 15
}

variable "chunk_size" {
  type        = number
  description = "value of the chunk size parameter"
  default     = 2000
}

variable "chunk_overlap" {
  type        = number
  description = "value of the chunk overlap parameter"
  default     = 0
}

variable "port" {
  type        = number
  description = "The port to expose the web app on"
  default     = 80
}

variable "docker_image_wa" {
  type        = string
  description = "The docker image to deploy on the web app with the tag. Should be in the format: <image>:<tag>"
}

variable "docker_image_fa" {
  type        = string
  description = "The docker image to deploy on the function app"
}

variable "docker_image_tag_fa" {
  type        = string
  description = "The tag of the docker image to deploy on the function app"
}

variable "docker_registry_server_url" {
  type        = string
  description = "The URL of the docker registry server (ACR, Docker Hub, etc.)"
}

variable "docker_registry_server_password" {
  type        = string
  description = "The password to connect to the docker registry server"
}

variable "docker_registry_server_username" {
  type        = string
  description = "The username to connect to the docker registry server"
}

variable "docker_enable_ci" {
  type        = string
  description = "Enable the CI/CD pipeline for the docker image"
  default     = "true"
}

variable "blob_connection_string" {
  type        = string
  description = "The connection string to the blob storage"
}

variable "blob_name" {
  type        = string
  description = "The name of the blob"
}

variable "blob_url" {
  type        = string
  description = "The URL of the blob"
}

variable "azure_bot_endpoint" {
  type        = string
  description = "The endpoint of the Azure Bot"
}

variable "azurerm_cognitive_account_location" {
  type        = string
  description = "The location of the Azure Cognitive Account. Due to the limitation of the Azure Cognitive Account, it cannot be created in all regions. Please refer to the documentation for more information. https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/models#model-summary-table-and-region-availability"
}