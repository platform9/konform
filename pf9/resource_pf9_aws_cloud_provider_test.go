package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestPf9AwsCloudProviderExample(t *testing.T){
	t.Parallel()
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/pf9-aws-cloud-provider-example",
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
