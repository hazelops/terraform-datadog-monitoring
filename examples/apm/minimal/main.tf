module "apm_monitor" {
  source       = "hazelops/alerts/datadog"
  env          = "dev"
  namespace    = "namespace"
  service_name = "YourServiceName"
  target_names = [
    "@slack-alerts",
    "@user:Some@Email.com"
  ]
}
