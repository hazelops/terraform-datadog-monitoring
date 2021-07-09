module "datadog_sqs_monitor" {
  source                 = "hazelops/monitoring/datadog//modules/sqs"
  dd_api_key             = "Datadog API Key"
  dd_app_key             = "Datadog APP Key"
  enabled                = true
  env                    = "your-environment"
  aws_account_id         = 1234566890 #your AWS account ID
  monitor_type           = "metric alert"
  sqs_normal_threshold   = 0
  sqs_warning_threshold  = 2
  sqs_critical_threshold = 10
  sqs_threshold_duration = "last_5m"
  sqs_queue_metric       = "avg:aws.sqs.approximate_number_of_messages_visible"
  queue_name             = "your-sqs-queue"
  renotify_interval      = 5

  notification_targets = [
    "@slack-alerts",
    "@user@somemail.com"
  ]
}
