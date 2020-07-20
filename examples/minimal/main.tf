provider "datadog" {
  api_key = "1234567890"
  app_key = "0987654321"
}
module "terraform-datadog-monitoring" {
  source = "hazelops/monitoring/datadog"
  version = "~> 1.0"
  env = "test"
  synthetics_name = "test"
  synthetics_recipient = "@john@test.com"
  synthetics_url = "http://test.com"
}


required_providers {
  aws = ">= 2.7.0"
}
}