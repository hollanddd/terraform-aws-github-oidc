variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "us-east-1"
}

variable "repo_name" {
  description = "Repo to grant access to assume role via OIDC"
  type = string
}
