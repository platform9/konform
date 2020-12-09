terraform {
  required_providers {
    pf9 = {
      source = "platform9/pf9"
      version = "0.1.3"
    }
  }
}
resource "pf9_aws_cloud_provider" "aws" {
    name       = "cloud_provider_example_test"
    type = "aws"
    key = ""
    secret = ""
    project_uuid = ""
}
