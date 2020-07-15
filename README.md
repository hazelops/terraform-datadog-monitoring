#terraform-datadog-monitoring

## Terraform datadog website monitor

This module:
- Creates datadog website synthetics browser test, api test and api test with SSL in Datadog. 
- You can monitor information in your Datadog account
- You will receive emails about changing the status of the website


## Usage:

1. Create necessary variables (you can use for example direnv)
2. There are three operating modes: test_browser, test_api, test_api\ssl. 
 - to choose test_api mode you need to specify the following variables (for example in direnv: TF_VAR_type=api and TF_VAR_subtype=http)
 - to choose test_api\ssl mode you need to specify the following variables (in direnv: TF_VAR_type=api and TF_VAR_subtype=ssl )
 - to choose browser test(it runs by default) you need to specify the following variables (in direnv: TF_VAR_type=browser) 
 3. You can use it standalone (Terraform plan, Terraform apply) or in your infrastructure.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| datadog | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| api\_assertions | n/a | `list` | <pre>[<br>  {<br>    "operator": "is",<br>    "target": "200",<br>    "type": "statusCode"<br>  }<br>]</pre> | no |
| api\_options | n/a | `map` | <pre>{<br>  "tick_every": 60<br>}</pre> | no |
| dd\_api\_key | n/a | `any` | n/a | yes |
| dd\_app\_key | n/a | `any` | n/a | yes |
| dd\_message\_down | n/a | `string` | `"There are some problems on:"` | no |
| dd\_message\_up | n/a | `string` | `"The problems is gone on:"` | no |
| device\_ids | n/a | `list` | <pre>[<br>  "laptop_large"<br>]</pre> | no |
| env | n/a | `any` | n/a | yes |
| locations | n/a | `list` | <pre>[<br>  "aws:us-west-1"<br>]</pre> | no |
| name | n/a | `any` | n/a | yes |
| recipient | n/a | `list` | `[]` | no |
| ssl\_assertions | n/a | `list` | <pre>[<br>  {<br>    "operator": "isInMoreThan",<br>    "target": 30,<br>    "type": "certificate"<br>  }<br>]</pre> | no |
| ssl\_options | n/a | `map` | <pre>{<br>  "accept_self_signed": true,<br>  "tick_every": 900<br>}</pre> | no |
| ssl\_port | n/a | `string` | `"443"` | no |
| subtype | n/a | `string` | `"http"` | no |
| tags | n/a | `list` | `[]` | no |
| type | n/a | `string` | `"browser"` | no |
| url | n/a | `any` | n/a | yes |
| webtest\_options | n/a | `map` | <pre>{<br>  "tick_every": 300<br>}</pre> | no |

## Outputs

No output.