module "terraform_datadog_monitoring" {
  source          = "hazelops/monitoring/datadog"
  version         = "~> 1.0"
  env             = "test"
  synthetics_name = "test"
  target_names = [
    "@slack-alerts",
    "@user:Some@Email.com"
  ]
  synthetics_url = "http://test.com"
}
