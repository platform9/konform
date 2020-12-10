terraform {
  required_providers {
    pf9 = {
      source = "terraform.example.com/awesomecorp/pf9"
      version = "1.0.0"
    }
  }
}
resource "pf9_aws_cloud_provider" "aws_terratest" {
    name       = "aws_terratest"
    type = "aws"
    key = ""
    secret = ""
    project_uuid = ""
}
resource "pf9_cluster" "cluster_1" {
    project_uuid = ""
    allow_workloads_on_master = 0
    ami = "ubuntu"
    app_catalog_enabled = 0
    azs = [
        "us-west-2a",
        "us-west-2b",
        "us-west-2c",
        "us-west-2d"
    ]
    containers_cidr = "10.20.0.0/16"
    domain_id = "/hostedzone/<domain_id>"
    external_dns_name = "auto-generate"
    internal_elb = false
    is_private = "false"
    master_flavor = "t2.medium"
    name = "tf-terratest-1"
    network_plugin = "flannel"
    node_pool_uuid = pf9_aws_cloud_provider.aws_terratest.nodepooluuid
    privileged = 1
    region = "us-west-2"
    runtime_config = ""
    service_fqdn = "auto-generate"
    services_cidr = "10.21.0.0/16"
    ssh_key = "<ssh-key>"
    worker_flavor = "t2.medium"
    num_masters = 1
    num_workers = 3
    enable_cas = "false"
}
