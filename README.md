# konform

## Terraform provider for PMK

Konform allows you to create and manage your PMK clusters using terraform.

### Getting Started

Konform requires Go v1.13+ to build.

Build the PMK terraform plugin.

```shell
go build -o terraform-provider-pf9
```

The binary needs to be of the form `terraform-provider-*`. If built correctly you should see a message like this when you run it directly:

```shell
[~/p/s/konform] : ./terraform-provider-pf9
This binary is a plugin. These are not meant to be executed directly.
Please execute the program that consumes these plugins, which will
load any plugins automatically
```

Terraform looks for the plugin in the local directory as well as under `$HOME/.terraform.d/plugins `. Once built, you may side load this executables onto any host that runs terraform by copying it into the directory given above. Please refer to the [terraform documentation](https://www.terraform.io/docs/configuration/providers.html#third-party-plugins) for more details.

### Usage

Konform requires you to source access credentials to the Platform9 Saas Management Plane(DU) before running terraform. Please create and source an environment file with the following fields set:

```shell
export DU_USERNAME=<Platform9 DU Username>
export DU_PASSWORD=<Password>
export DU_FQDN=<FQDN>
export DU_TENANT=<Tenant Name>
```

Cluster configuration options are then added to the terraform script and run. A sample terraform script is in [main.tf](https://github.com/platform9/konform/blob/master/main.tf) for your reference.

## Terraform options
The following resources and their config options are currently supported.

### pf9_aws_cloud_provider
Create and manage an AWS cloud provider for PMK. Allowed config options:
```
name    (string) Name of the provider
type    (string) options: aws/azure
key     (string) AWS access key
secret  (string) AWS secret key
```

### pf9_azure_cloud_provider
Create and manage an AWS cloud provider for PMK. Allowed config options:
```
name            (string) Name of the provider
type            (string) options: aws/azure
project_uuid    (string) Azure project ID
client_id       (string) Azure Client ID
client_secret   (string) Azure Client Secret
subscription_id (string) Azure Subscription ID
tenant_id       (string) Azure Tenant ID
```

### pf9_cluster
Create and manage PMK clusters. Allowed config options:
```
project_uuid                (string)    PMK Project UUID
name                        (string)    Name of the cluster
allow_workloads_on_master   (int)       Allow workloads on master nodes options: 0/1
ami                         (string)    AWS clusters: AWS Image ID
app_catalog_enabled         (int)       Enable/Disable App Catalog. options: 0/1
azs                         (list)      List of AWS availability zones. Example: ["az1", "az2"]
containers_cidr             (string)    Subnet used for Pod IPs
service_cidr                (string)    Subnet used for Service IPs
domain_id                   (string)    AWS Domain ID
external_dns_name           (string)    "auto-generate", or provide DNS name
http_proxy                  (string)    (optional) Specify the HTTP proxy for this cluster. Format: <scheme>://<username>:<password>@<host>:<port>
internal_elb                (boolean)   Enable or disable elastic load balancer
is_private                  (boolean)   Private cluster (for advanced users only)
k8s_api_port                (string)    Port on which the k8s API server listens on
master_flavor               (string)    Flavor of master nodes
worker_flavor               (string)    Flavor of worker nodes
num_masters                 (string)    Number of masters. Recommended: 1, 3, or 5.
num_workers                 (string)    Number of workers.
enable_cas                  (boolean)   Enable or disable cluster auto scaler.
masterless                  (int)       Run masterless (0/1) (for advanced users)    
network_plugin              (string)    Network plugin to use: Available options: flannel, calico, canal(experimental)
calico_ip_ip_mode           (string)    IP-IP mode if using the calico network plugin. Available options: Always, Never, CrossSubnet (default: Always)
calico_nat_outgoing         (boolean)   Enable outgoing NAT for calico nodes (default: True)
node_pool_uuid              (string)    AWS node pool UUID
private_subnets             (list)      List of private subnets to use
privileged                  (int)       Allow/disallow privileged containers (0/1)    
region                      (string)    AWS region
runtime_config              (string)    Runtime config data
service_fqdn                (string)    "auto-generate" or provide FQDN for service endpoints
ssh_key                     (string)    Keyname for SSH access to nodes
subnets                     (list)      List of subnets to use (advanced)
tags                        (map)       Tags to apply on nodes (key-value pairs)
use_pf9_domain              (boolean)   Use platform9 domains for FQDNs
vpc                         (string)    Name of AWS VPC for nodes
master_vip_ipv4             (string)    Virtual IP for master nodes
master_vip_iface            (string)    Interface to attach master VIP to
enable_metal_lb             (boolean)   Enable/disable MetalLB
metallb_cidr                (string)    MetalLB CIDR
```

## Issues
Please feel free to raise issues via Github with any relevant information useful to debug the error.

## Contributing

1. Clone this repository locally.
2. Make any changes you want in your cloned repository, and when you are ready to send those changes to us, push your changes to an upstream branch and [create a pull request](https://help.github.com/articles/creating-a-pull-request/).
3. Once your pull request is created, a reviewer will take responsibility for providing clear, actionable feedback. As the owner of the pull request, it is your responsibility to modify your pull request to address the feedback that has been provided to you by the reviewer(s).
4. After your review has been approved, it will be merged into to the repository.
