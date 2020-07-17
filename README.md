# Terraform datadog synthetics monitor

## This module:
- Creates datadog website synthetics ```browser test```, ```api test``` and ```api test with SSL``` in Datadog. 
- You can monitor information in your Datadog account.
- You will receive messages about changing the status.


## Usage:

  Create necessary variables.

  There are three operating modes: ```test_browser```, ```test_api```, ```test_api/ssl```. 
 - to choose ```test_api``` mode you should pass variables (```synthetics_type=api``` and ```synthetics_subtype=http```)
 - to choose ```test_api/ssl``` mode you should pass variables (```synthetics_type=api``` and ```synthetics_subtype=ssl```)
 - to choose ```browser test```(it runs by default in minimal configuration) you should pass variable (```synthetics_type=browser```)
  
  You can use examples.

## Examples:

#### Minimal:
```
 module "terraform-datadog-monitoring" {
  source = "hazelops/monitoring/datadog"
  version = "~> 1.0"
  api_key = "1234567890"
  app_key = "0987654321"
  env = "test"
  synthetics_name = "test"
  synthetics_recipient = "@john@test.com" 
  synthetics_url = "http://test.com"
}
```

#### Complete:
```
    module "terraform-datadog-monitoring" {
     source = "hazelops/monitoring/datadog"
     version = "~> 1.0"
     api_key = "1234567890"
     app_key = "0987654321"
     env = "test"
     synthetics_name = "test"
     synthetics_recipient = "@john@test.com"
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


#### Providers

| Name | Version |
|------|---------|
| datadog | n/a |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| api\_key | n/a | `any` | n/a | yes |
| app\_key | n/a | `any` | n/a | yes |
| env | n/a | `any` | n/a | yes |
| synthetics\_alert\_down | n/a | `string` | `"There are some problems on:"` | no |
| synthetics\_alert\_up | n/a | `string` | `"The problems are gone on:"` | no |
| synthetics\_api\_assertions | n/a | `list` | <pre>[<br>  {<br>    "operator": "is",<br>    "target": "200",<br>    "type": "statusCode"<br>  }<br>]</pre> | no |
| synthetics\_api\_options | n/a | `map` | <pre>{<br>  "tick_every": 60<br>}</pre> | no |
| synthetics\_device\_ids | n/a | `list` | <pre>[<br>  "laptop_large"<br>]</pre> | no |
| synthetics\_locations | n/a | `list` | <pre>[<br>  "aws:us-west-1"<br>]</pre> | no |
| synthetics\_name | n/a | `any` | n/a | yes |
| synthetics\_recipient | n/a | `any` | n/a | yes |
| synthetics\_ssl\_assertions | n/a | `list` | <pre>[<br>  {<br>    "operator": "isInMoreThan",<br>    "target": 30,<br>    "type": "certificate"<br>  }<br>]</pre> | no |
| synthetics\_ssl\_options | n/a | `map` | <pre>{<br>  "accept_self_signed": true,<br>  "tick_every": 900<br>}</pre> | no |
| synthetics\_ssl\_port | n/a | `string` | `"443"` | no |
| synthetics\_status | n/a | `string` | `"live"` | no |
| synthetics\_subtype | n/a | `string` | `"http"` | no |
| synthetics\_tags | n/a | `list` | `[]` | no |
| synthetics\_type | n/a | `string` | `"browser"` | no |
| synthetics\_url | n/a | `any` | n/a | yes |
| synthetics\_webtest\_options | n/a | `map` | <pre>{<br>  "tick_every": 300<br>}</pre> | no |

#### Outputs

No output

## Terraform Module Registry

![Hazelops logo](https://avatars0.githubusercontent.com/u/63737915?s=25&v=4) [Terraform Datadog Synthetics
](https://registry.terraform.io/modules/hazelops/synthetics/datadog)

Maintainer: [Dmitry Borisov](https://github.com/kobrikx)