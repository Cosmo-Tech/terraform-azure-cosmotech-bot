resource "random_integer" "this" {
  max = 999999
  min = 100000
}

locals {
  search_endpoint_url = "https://${azurerm_search_service.this.name}.search.windows.net"
}

data "azurerm_resource_group" "this" {
  name = var.resource_group
}

data "azurerm_storage_account" "this" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.this.name
}

resource "azurerm_search_service" "this" {
  name                          = "cosmobot-search-${random_integer.this.result}"
  resource_group_name           = data.azurerm_resource_group.this.name
  location                      = data.azurerm_resource_group.this.location
  sku                           = "standard"
  local_authentication_enabled  = true
  partition_count               = 1
  public_network_access_enabled = true
}

data "azurerm_client_config" "current" {}

resource "azuread_application" "bot" {
  display_name = "cosmobot-${random_integer.this.result}"
  owners       = [data.azurerm_client_config.current.object_id]
}

resource "azuread_application_password" "this" {
  application_id = azuread_application.bot.id
}

resource "azurerm_bot_service_azure_bot" "this" {
  name                       = "azurebot-${random_integer.this.result}"
  resource_group_name        = data.azurerm_resource_group.this.name
  location                   = "global"
  microsoft_app_id           = azuread_application.bot.client_id
  sku                        = "S1"
  microsoft_app_type         = "MultiTenant"
  streaming_endpoint_enabled = false

  endpoint                              = var.azure_bot_endpoint
  developer_app_insights_application_id = azurerm_application_insights.this.app_id
}

resource "azurerm_application_insights" "this" {
  name                = "appinsights-${random_integer.this.result}"
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  application_type    = "web"
}

resource "azurerm_cognitive_account" "this" {
  name                = "llm-account-${random_integer.this.result}"
  location            = var.azurerm_cognitive_account_location
  resource_group_name = data.azurerm_resource_group.this.name
  kind                = "OpenAI"
  sku_name            = "S0"
}

resource "azurerm_cognitive_deployment" "gpt" {
  name                 = "deployment-gpt-${random_integer.this.result}"
  cognitive_account_id = azurerm_cognitive_account.this.id
  model {
    format = "OpenAI"
    name   = var.llm_deployment_name
  }

  scale {
    type = "Standard"
  }

  lifecycle {
    ignore_changes = [model]
  }
}

resource "azurerm_cognitive_deployment" "embedded" {
  name                 = "deployment-embedded-${random_integer.this.result}"
  cognitive_account_id = azurerm_cognitive_account.this.id
  model {
    format = "OpenAI"
    name   = var.embeddings_deployment_name
  }

  scale {
    type = "Standard"
  }

  lifecycle {
    ignore_changes = [model]
  }
}

resource "azurerm_service_plan" "this" {
  name                     = "llm-plan-${random_integer.this.result}"
  resource_group_name      = data.azurerm_resource_group.this.name
  location                 = data.azurerm_resource_group.this.location
  os_type                  = "Linux"
  sku_name                 = "B1"
  per_site_scaling_enabled = false
  worker_count             = 1
  zone_balancing_enabled   = false
}

resource "azurerm_linux_web_app" "this" {
  name                = "webapp-cosmobot-${random_integer.this.result}"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  service_plan_id     = azurerm_service_plan.this.id
  https_only          = true

  identity {
    type = "SystemAssigned"
  }

  site_config {
    ftps_state = "FtpsOnly"
    application_stack {
      docker_image_name        = var.docker_image_wa
      docker_registry_url      = var.docker_registry_server_url
      docker_registry_username = var.docker_registry_server_username
      docker_registry_password = var.docker_registry_server_password
    }
  }

  app_settings = {
    AAD_TENANT_ID                       = var.tenant_id
    ADX_AAD_APP_ID                      = var.platform_app_registration_id,
    ADX_AAD_SECRET                      = var.platform_app_registration_secret,
    AZURE_BOT_APP_ID                    = azuread_application.bot.id,
    AZURE_BOT_PASSWORD                  = azuread_application_password.this.value,
    AZURE_OPEN_AI_API_KEY               = azurerm_cognitive_account.this.primary_access_key,
    AZURE_OPEN_AI_API_TYPE              = var.azure_open_ai_api_type,
    AZURE_OPEN_AI_API_VERSION           = var.azure_open_ai_api_version,
    AZURE_OPEN_AI_ENDPOINT              = azurerm_cognitive_account.this.endpoint,
    CHUNK_SIZE                          = var.chunk_size,
    CHUNK_OVERLAP                       = var.chunk_overlap,
    CONTEXT_FILE_PATH                   = var.context_file_path,
    DOCKER_ENABLE_CI                    = var.docker_enable_ci
    EMBEDDINGS_DEPLOYEMENT_NAME         = var.embeddings_deployment_name,
    INDEX_NAME                          = var.index_name,
    IS_VECTOR_STORE_LOCAL               = var.is_vector_store_local,
    KUSTO_CLUSTER_URL                   = var.kusto_cluster_url,
    KUSTO_DATABASE                      = var.kusto_database,
    LLM_DEPLOYMENT_NAME                 = var.llm_deployment_name,
    MAX_TOKEN                           = var.max_token,
    PORT                                = var.port,
    RETRIEVED_DOCUMENT_NB               = var.retrieved_document_nb,
    SEARCH_API_KEY                      = azurerm_search_service.this.primary_key,
    SEARCH_ENDPOINT_URL                 = local.search_endpoint_url,
    STREAMING                           = var.streaming,
    STREAMING_STEP                      = var.streaming_step,
    TEMPERATURE                         = var.temperature,
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = var.websites_enable_app_service_storage,
  }

  depends_on = [azurerm_cognitive_account.this, azurerm_search_service.this, azuread_application.bot, azuread_application_password.this]
}

resource "azurerm_service_plan" "that" {
  name                     = "llm-plan2-${random_integer.this.result}"
  resource_group_name      = data.azurerm_resource_group.this.name
  location                 = data.azurerm_resource_group.this.location
  os_type                  = "Linux"
  sku_name                 = "EP1"
  per_site_scaling_enabled = false
  worker_count             = 1
  zone_balancing_enabled   = false
}

resource "azurerm_linux_function_app" "this" {
  name                = "function-app-cosmobot-${random_integer.this.result}"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  service_plan_id            = azurerm_service_plan.that.id
  https_only                 = true

  site_config {
    ftps_state               = "FtpsOnly"
    elastic_instance_minimum = 1

    application_stack {
      docker {
        image_name        = var.docker_image_fa
        image_tag         = var.docker_image_tag_fa
        registry_password = var.docker_registry_server_password
        registry_url      = var.docker_registry_server_url
        registry_username = var.docker_registry_server_username
      }
    }
  }

  app_settings = {
    AZURE_OPEN_AI_API_KEY               = azurerm_cognitive_account.this.primary_access_key,
    AZURE_OPEN_AI_API_TYPE              = var.azure_open_ai_api_type,
    AZURE_OPEN_AI_API_VERSION           = var.azure_open_ai_api_version,
    AZURE_OPEN_AI_ENDPOINT              = azurerm_cognitive_account.this.endpoint,
    BLOB_CONNECTION_STRING              = var.blob_connection_string,
    BLOB_NAME                           = var.blob_name,
    BLOB_URL                            = var.blob_url,
    CHUNK_SIZE                          = var.chunk_size,
    CHUNK_OVERLAP                       = var.chunk_overlap,
    DOCKER_ENABLE_CI                    = var.docker_enable_ci
    EMBEDDINGS_DEPLOYEMENT_NAME         = var.embeddings_deployment_name,
    ENABLE_ORYX_BUILD                   = var.enable_oryx_build,
    INDEX_NAME                          = var.index_name,
    RETRIEVED_DOCUMENT_NB               = var.retrieved_document_nb,
    SCM_DO_BUILD_DURING_DEPLOYMENT      = var.scm_do_build_during_deployment,
    SEARCH_API_KEY                      = azurerm_search_service.this.primary_key,
    SEARCH_ENDPOINT_URL                 = local.search_endpoint_url
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = var.websites_enable_app_service_storage
  }

  depends_on = [azurerm_cognitive_account.this, azurerm_search_service.this]
}