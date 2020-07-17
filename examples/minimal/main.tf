module "terraform-datadog-monitoring" {
  source = "/hazelops/synthetics/datadog"
  version = "~> 1.0"
  api_key = 1234567890
  app_key = 0987654321
  env = "test"
  synthetics_name = "test"
  synthetics_recipient = "@john@test.com"
  synthetics_url = "htpp://test.com"
}
