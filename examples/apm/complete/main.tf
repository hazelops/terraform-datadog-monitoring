module "apm_monitor" {
  source                     = "hazelops/alerts/datadog"
  enabled                    = true
  env                        = "dev"
  namespace                  = "namespace"
  service_name               = "YourServiceName"
  monitor_type               = "metric alert"
  latency_metric             = "trace.flask.request"
  latency_threshold_duration = "last_10m"
  latency_alert_threshold    = "> 0.5"
  error_metric               = "trace.flask.request"
  error_threshold_duration   = "last_10m"
  error_alert_threshold      = "> 0.05"
  target_names = [
    "@slack-alerts",
    "@user:some@email.com"
  ]
}