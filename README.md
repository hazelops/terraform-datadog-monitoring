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

