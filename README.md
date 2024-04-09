<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.47.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.97.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.47.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.97.1 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Resources

| Name | Type |
|------|------|
| [azuread_application.bot](https://registry.terraform.io/providers/hashicorp/azuread/2.47.0/docs/resources/application) | resource |
| [azuread_application_password.this](https://registry.terraform.io/providers/hashicorp/azuread/2.47.0/docs/resources/application_password) | resource |
| [azurerm_application_insights.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.97.1/docs/resources/application_insights) | resource |
| [azurerm_bot_service_azure_bot.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.97.1/docs/resources/bot_service_azure_bot) | resource |
| [azurerm_cognitive_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.97.1/docs/resources/cognitive_account) | resource |
| [azurerm_cognitive_deployment.embedded](https://registry.terraform.io/providers/hashicorp/azurerm/3.97.1/docs/resources/cognitive_deployment) | resource |
| [azurerm_cognitive_deployment.gpt](https://registry.terraform.io/providers/hashicorp/azurerm/3.97.1/docs/resources/cognitive_deployment) | resource |
| [azurerm_linux_function_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.97.1/docs/resources/linux_function_app) | resource |
| [azurerm_linux_web_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.97.1/docs/resources/linux_web_app) | resource |
| [azurerm_search_service.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.97.1/docs/resources/search_service) | resource |
| [azurerm_service_plan.that](https://registry.terraform.io/providers/hashicorp/azurerm/3.97.1/docs/resources/service_plan) | resource |
| [azurerm_service_plan.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.97.1/docs/resources/service_plan) | resource |
| [random_integer.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.97.1/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.97.1/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.97.1/docs/data-sources/storage_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_bot_endpoint"></a> [azure\_bot\_endpoint](#input\_azure\_bot\_endpoint) | The endpoint of the Azure Bot | `string` | n/a | yes |
| <a name="input_azurerm_cognitive_account_location"></a> [azurerm\_cognitive\_account\_location](#input\_azurerm\_cognitive\_account\_location) | The location of the Azure Cognitive Account. Due to the limitation of the Azure Cognitive Account, it cannot be created in all regions. Please refer to the documentation for more information. https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/models#model-summary-table-and-region-availability | `string` | n/a | yes |
| <a name="input_blob_connection_string"></a> [blob\_connection\_string](#input\_blob\_connection\_string) | The connection string to the blob storage | `string` | n/a | yes |
| <a name="input_blob_name"></a> [blob\_name](#input\_blob\_name) | The name of the blob | `string` | n/a | yes |
| <a name="input_blob_url"></a> [blob\_url](#input\_blob\_url) | The URL of the blob | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The client ID of the service principal used to authenticate with Azure. Press <ENTER> to skip and use your own identity. | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The client secret of the service principal used to authenticate with Azure. Press <ENTER> to skip and use your own identity. | `string` | n/a | yes |
| <a name="input_context_file_path"></a> [context\_file\_path](#input\_context\_file\_path) | The path to the context file | `string` | n/a | yes |
| <a name="input_docker_image_fa"></a> [docker\_image\_fa](#input\_docker\_image\_fa) | The docker image to deploy on the function app | `string` | n/a | yes |
| <a name="input_docker_image_tag_fa"></a> [docker\_image\_tag\_fa](#input\_docker\_image\_tag\_fa) | The tag of the docker image to deploy on the function app | `string` | n/a | yes |
| <a name="input_docker_image_tag_wa"></a> [docker\_image\_tag\_wa](#input\_docker\_image\_tag\_wa) | The tag of the docker image to deploy on the web app | `string` | n/a | yes |
| <a name="input_docker_image_wa"></a> [docker\_image\_wa](#input\_docker\_image\_wa) | The docker image to deploy on the web app | `string` | n/a | yes |
| <a name="input_docker_registry_server_password"></a> [docker\_registry\_server\_password](#input\_docker\_registry\_server\_password) | The password to connect to the docker registry server | `string` | n/a | yes |
| <a name="input_docker_registry_server_url"></a> [docker\_registry\_server\_url](#input\_docker\_registry\_server\_url) | The URL of the docker registry server (ACR, Docker Hub, etc.) | `string` | n/a | yes |
| <a name="input_docker_registry_server_username"></a> [docker\_registry\_server\_username](#input\_docker\_registry\_server\_username) | The username to connect to the docker registry server | `string` | n/a | yes |
| <a name="input_index_name"></a> [index\_name](#input\_index\_name) | The name of the index | `string` | n/a | yes |
| <a name="input_kusto_cluster_url"></a> [kusto\_cluster\_url](#input\_kusto\_cluster\_url) | The URL of the Kusto cluster to connect to | `string` | n/a | yes |
| <a name="input_kusto_database"></a> [kusto\_database](#input\_kusto\_database) | The name of the Kusto database to connect to | `string` | n/a | yes |
| <a name="input_platform_app_registration_id"></a> [platform\_app\_registration\_id](#input\_platform\_app\_registration\_id) | The Client ID of the app registration of the platform app | `string` | n/a | yes |
| <a name="input_platform_app_registration_secret"></a> [platform\_app\_registration\_secret](#input\_platform\_app\_registration\_secret) | The Client Secret of the app registration of the platform app | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of the resource group to deploy the resources | `string` | n/a | yes |
| <a name="input_retrieved_document_nb"></a> [retrieved\_document\_nb](#input\_retrieved\_document\_nb) | The number of documents to retrieve from the search service | `string` | n/a | yes |
| <a name="input_search_api_key"></a> [search\_api\_key](#input\_search\_api\_key) | The API key of the search service | `string` | n/a | yes |
| <a name="input_search_endpoint_url"></a> [search\_endpoint\_url](#input\_search\_endpoint\_url) | The URL of the search endpoint | `string` | n/a | yes |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | The access key of the storage account | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The name of the storage account | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The Azure subscription ID | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The tenant ID of the service principal / User used to authenticate with Azure | `string` | n/a | yes |
| <a name="input_azure_open_ai_api_type"></a> [azure\_open\_ai\_api\_type](#input\_azure\_open\_ai\_api\_type) | The type of the Azure Open AI service | `string` | `"azure"` | no |
| <a name="input_azure_open_ai_api_version"></a> [azure\_open\_ai\_api\_version](#input\_azure\_open\_ai\_api\_version) | The version of the Azure Open AI API service | `string` | `"2023-10-01-preview"` | no |
| <a name="input_chunk_overlap"></a> [chunk\_overlap](#input\_chunk\_overlap) | value of the chunk overlap parameter | `number` | `0` | no |
| <a name="input_chunk_size"></a> [chunk\_size](#input\_chunk\_size) | value of the chunk size parameter | `number` | `2000` | no |
| <a name="input_docker_enable_ci"></a> [docker\_enable\_ci](#input\_docker\_enable\_ci) | Enable the CI/CD pipeline for the docker image | `string` | `"true"` | no |
| <a name="input_embeddings_deployment_name"></a> [embeddings\_deployment\_name](#input\_embeddings\_deployment\_name) | The name of the deployment for the embeddings model. See the documentation for more information: https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/models | `string` | `"text-embedding-ada-002"` | no |
| <a name="input_is_vector_store_local"></a> [is\_vector\_store\_local](#input\_is\_vector\_store\_local) | Whether the vector store is local or not | `string` | `"false"` | no |
| <a name="input_llm_deployment_name"></a> [llm\_deployment\_name](#input\_llm\_deployment\_name) | The name of the deployment for the LLM model. See the documentation for more information: https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/models | `string` | `"gpt-4"` | no |
| <a name="input_max_token"></a> [max\_token](#input\_max\_token) | The value of the max\_token parameter | `number` | `4096` | no |
| <a name="input_port"></a> [port](#input\_port) | The port to expose the web app on | `number` | `80` | no |
| <a name="input_streaming"></a> [streaming](#input\_streaming) | Wether to enable streaming or not | `bool` | `false` | no |
| <a name="input_streaming_step"></a> [streaming\_step](#input\_streaming\_step) | value of the streaming step parameter | `number` | `15` | no |
| <a name="input_temperature"></a> [temperature](#input\_temperature) | value of the temperature parameter | `string` | `"0.2"` | no |
| <a name="input_websites_enable_app_service_storage"></a> [websites\_enable\_app\_service\_storage](#input\_websites\_enable\_app\_service\_storage) | n/a | `string` | `"false"` | no |
<!-- END_TF_DOCS -->