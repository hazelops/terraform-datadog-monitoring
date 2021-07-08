# Terraform Datadog Monitors Module

Terraform module that creates Datadog alert monitors for latency and errors, Datadog SQS monitor and Datadog synthetics tests

## Description

This module provides settings:

- Create alert monitors for `latency` and `errors` in Datadog.
- Creates Datadog website synthetics `browser test`, `api test` and `api test with SSL` in Datadog.
- Create alert monitor in Datadog

## Usage

Before start, you should get Datadog API key and Datadog APP key from Datadog website.

To get the keys please follow this [manual](https://docs.datadoghq.com/account_management/api-app-keys/)

- to create error or alert monitors please refer to this [guide](./modules/apm/README.md)
  
- to create Datadog website synthetics `browser test`, `api test` and `api test with SSL` please refer to this [guide](./modules/synthetics/README.md)
 
- to create Datadog SQS monitor please refer to this [guide](./modules/sqs/README.md)

Also you can find examples of using in [examples](./examples) folder.
