# Create environment for testing Datadog SQS monitoring module

 - create SQS queue [manually]() or with terraform:

```hcl
module "test_sqs" {
  source                     = "terraform-aws-modules/sqs/aws"
  version                    = "~> 2.0"
  visibility_timeout_seconds = 900
  name                       = "test"
}
```

 - add environment variables:

```shell
export AWS_PROFILE=<aws-profile>
export ENV=<aws-environment>
export AWS_REGION=<aws-region>
export SQS_QUEUE_URL=<sqs-queue-url>
```
 Or you can use [direnv](https://direnv.net/)
 - run virtual python shell:

```shell
pipenv shell --python /usr/bin/python3
```

 - to create message in SQS run:
```shell
python3 send.py
```

- to read and delete message run:
```shell
python3 receive_delete.py
```

For more information, please visit: https://boto3.amazonaws.com/v1/documentation/api/latest/guide/sqs-example-sending-receiving-msgs.html
