//resource "datadog_integration_pagerduty" "pd" {
//  schedules = [
//    "https://ddog.pagerduty.com/schedules/X123VF",
//    "https://ddog.pagerduty.com/schedules/X321XX"
//  ]
//  subdomain = "ddog"
//  api_token = "38457822378273432587234242874"
//}
//
//resource "datadog_integration_pagerduty_service_object" "testing_foo" {
//  # when creating the integration object for the first time, the service
//  # objects have to be created *after* the integration
//  depends_on   = ["datadog_integration_pagerduty.pd"]
//  service_name = "testing_foo"
//  service_key  = "9876543210123456789"
//}
//
//resource "datadog_integration_pagerduty_service_object" "testing_bar" {
//  depends_on   = ["datadog_integration_pagerduty.pd"]
//  service_name = "testing_bar"
//  service_key  = "54321098765432109876"
//}

// Will be implemented later
