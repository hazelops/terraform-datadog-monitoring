# Terraform datadog synthetics monitor

## This module:
- Creates datadog website synthetics `browser test`, `api test` and `api test with SSL` in Datadog. 
- You can monitor information in your Datadog account.
- You will receive messages about changing the status.


## Usage:

  Create necessary variables.

  There are three operating modes: `test_browser`, `test_api`, `test_api/ssl`. 
 - to choose `test_api` mode you should pass variables (`synthetics_type=api` and `synthetics_subtype=http`)
 - to choose `test_api/ssl` mode you should pass variables (`synthetics_type=api` and `synthetics_subtype=ssl`)
 - to choose `browser test`(it runs by default in minimal configuration) you should pass variable (`synthetics_type=browser`)
  
  You can use examples.

## Examples:

#### Minimal:
```
   module "terraform_datadog_monitoring" {
    source = "hazelops/monitoring/datadog"
    version = "~> 1.0"
    env = "test"
    synthetics_name = "test"
    target_names = [
    "@slack-alerts",
    "@user:Some@Email.com"
    ] 
    synthetics_url = "http://test.com"
   }
```

#### Complete:
```
    module "terraform_datadog_monitoring" {
     source = "hazelops/monitoring/datadog"
     version = "~> 1.0"
     env = "test"
     synthetics_name = "test"
     target_names = [
    "@slack-alerts",
    "@user:Some@Email.com"
     ]
     synthetics_url = "http://test.com"
     synthetics_tags = ["test1", "test2"]
     synthetics_type = "browser"
     synthetics_subtype = "http"
     synthetics_device_ids = ["laptop_large"]
     synthetics_locations = ["aws:us-west-1"]
     synthetics_webtest_options = {
        tick_every = 300
      }
     synthetics_alert_down = "There are some problems on:"
     synthetics_alert_up = "The problems are gone on:"
     synthetics_api_options = {
        tick_every = 60
     }
     synthetics_api_assertions = [
      {
        type = "statusCode"
        operator = "is"
        target = "200"
      }
     ]
     synthetics_ssl_port = "443"
     synthetics_ssl_options = {
        tick_every = 900
        accept_self_signed = true
     }
     synthetics_ssl_assertions = [
       {
        type = "certificate"
        operator = "isInMoreThan"
        target = 30
       }
     ]
     synthetics_status = "live"
    }
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_synthetics_test.test_api](https://registry.terraform.io/providers/hashicorp/datadog/latest/docs/resources/synthetics_test) | resource |
| [datadog_synthetics_test.test_browser](https://registry.terraform.io/providers/hashicorp/datadog/latest/docs/resources/synthetics_test) | resource |
| [datadog_synthetics_test.test_ssl](https://registry.terraform.io/providers/hashicorp/datadog/latest/docs/resources/synthetics_test) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | n/a | `any` | n/a | yes |
| <a name="input_synthetics_alert_down"></a> [synthetics\_alert\_down](#input\_synthetics\_alert\_down) | n/a | `string` | `"There are some problems on:"` | no |
| <a name="input_synthetics_alert_up"></a> [synthetics\_alert\_up](#input\_synthetics\_alert\_up) | n/a | `string` | `"The problems are gone on:"` | no |
| <a name="input_synthetics_api_assertions"></a> [synthetics\_api\_assertions](#input\_synthetics\_api\_assertions) | n/a | `list` | <pre>[<br>  {<br>    "operator": "is",<br>    "target": "200",<br>    "type": "statusCode"<br>  }<br>]</pre> | no |
| <a name="input_synthetics_api_options"></a> [synthetics\_api\_options](#input\_synthetics\_api\_options) | n/a | `map` | <pre>{<br>  "tick_every": 60<br>}</pre> | no |
| <a name="input_synthetics_device_ids"></a> [synthetics\_device\_ids](#input\_synthetics\_device\_ids) | n/a | `list` | <pre>[<br>  "laptop_large"<br>]</pre> | no |
| <a name="input_synthetics_locations"></a> [synthetics\_locations](#input\_synthetics\_locations) | n/a | `list` | <pre>[<br>  "aws:us-west-1"<br>]</pre> | no |
| <a name="input_synthetics_name"></a> [synthetics\_name](#input\_synthetics\_name) | n/a | `any` | n/a | yes |
| <a name="input_synthetics_ssl_assertions"></a> [synthetics\_ssl\_assertions](#input\_synthetics\_ssl\_assertions) | n/a | `list` | <pre>[<br>  {<br>    "operator": "isInMoreThan",<br>    "target": 30,<br>    "type": "certificate"<br>  }<br>]</pre> | no |
| <a name="input_synthetics_ssl_options"></a> [synthetics\_ssl\_options](#input\_synthetics\_ssl\_options) | n/a | `map` | <pre>{<br>  "accept_self_signed": true,<br>  "tick_every": 900<br>}</pre> | no |
| <a name="input_synthetics_ssl_port"></a> [synthetics\_ssl\_port](#input\_synthetics\_ssl\_port) | n/a | `string` | `"443"` | no |
| <a name="input_synthetics_status"></a> [synthetics\_status](#input\_synthetics\_status) | n/a | `string` | `"live"` | no |
| <a name="input_synthetics_subtype"></a> [synthetics\_subtype](#input\_synthetics\_subtype) | n/a | `string` | `"http"` | no |
| <a name="input_synthetics_tags"></a> [synthetics\_tags](#input\_synthetics\_tags) | n/a | `list` | `[]` | no |
| <a name="input_synthetics_type"></a> [synthetics\_type](#input\_synthetics\_type) | n/a | `string` | `"browser"` | no |
| <a name="input_synthetics_url"></a> [synthetics\_url](#input\_synthetics\_url) | n/a | `any` | n/a | yes |
| <a name="input_synthetics_webtest_options"></a> [synthetics\_webtest\_options](#input\_synthetics\_webtest\_options) | n/a | `map` | <pre>{<br>  "tick_every": 300<br>}</pre> | no |
| <a name="input_target_names"></a> [target\_names](#input\_target\_names) | List of targets to inform. For example it could be @slack-alerts or @user:name@somemail.com. For more info visit https://docs.datadoghq.com/monitors/notifications/?tab=is_alert#notifications | `list` | n/a | yes |

## Outputs

No outputs.

![Hazelops logo](https://avatars0.githubusercontent.com/u/63737915?s=25&v=4) [Terraform Datadog Synthetics
](https://registry.terraform.io/modules/hazelops/synthetics/datadog)

Maintainer: [Dmitry Borisov](https://github.com/kobrikx)