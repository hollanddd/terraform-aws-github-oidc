module "oidc_provider" {
  source = "github.com/philips-labs/terraform-aws-github-oidc?ref=v0.8.1/modules/provider"
}

data "aws_caller_identity" "current" {}

module "oidc_repo_name" {
  source = "github.com/philips-labs/terraform-aws-github-oidc?ref=v0.8.1"

  openid_connect_provider_arn = module.oidc_provider.openid_connect_provider.arn
  repo                        = var.repo_name
  role_name                   = "role-name"
  account_ids                 = [data.aws_caller_identity.current.account_id]
}

# resources are not needed to make call to `aws sts get-caller-identity`
# https://docs.aws.amazon.com/cli/latest/reference/sts/get-caller-identity.html
