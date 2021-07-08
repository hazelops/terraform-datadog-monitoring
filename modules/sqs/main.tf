# Creates SQS monitor alert
resource "datadog_monitor" "sqs_queue_size" {
  count               = var.enabled ? 1 : 0
  name                = "Too many messages in queue ${var.env}-${var.queue_name}"
  type                = var.monitor_type
  notify_no_data      = true
  require_full_window = false
  include_tags        = true
  renotify_interval   = var.renotify_interval
  query               = "avg(${var.sqs_threshold_duration}):${var.sqs_queue_metric}{aws_account:${var.aws_account_id},queuename:${var.queue_name}} > ${var.sqs_critical_threshold}"

  monitor_thresholds {
    ok       = var.sqs_normal_threshold
    warning  = var.sqs_warning_threshold
    critical = var.sqs_critical_threshold
  }

  tags = [
    "env:${var.env}",
    "service:${var.queue_name}",
    "terraform:true"
  ]
  message            = <<EOM
{{#is_no_data}}Monitor doesn't have data on ${var.env}-${var.queue_name}{{/is_no_data}}
{{#is_warning}}SQS queue size on ${var.env}-${var.queue_name} is more than ${var.sqs_warning_threshold} {{/is_warning}}
{{#is_alert}}SQS queue '${var.queue_name}' size on ${var.env}-${var.queue_name} is more than ${var.sqs_critical_threshold} {{/is_alert}}
${join(" ", var.notification_targets)}
EOM
  escalation_message = <<EOM
SQS queue '${var.queue_name}' size on ${var.env}-${var.queue_name} is back to normal.
However, please check SQS queue at ${var.env}-${var.queue_name}
${join(" ", var.notification_targets)}
EOM
}
