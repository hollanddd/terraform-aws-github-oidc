# Example Terraform AWS OIDC integration with GitHub Actions

This repository contains an example of using the [terraform-aws-github-oidc](https://github.com/philips-labs/terraform-aws-github-oidc) module to create an OpenID connect integration for GitHub repositories.


## Usage

```bash
git clone https://github.com/hollanddd/terraform-aws-github-oidc.git
cd terraform-aws-github-oidc
```

Replace instances of `repo-name` and `role-name` with names of your choosing. `repo-name` must be the same as the repository you want to create permissions for.

```bash
terraform init
terraform apply
```

**Note:** When prompted to provide the repo it should be in the form of `org/repo-name`

```
Repo to grant access to assume role via OIDC

Enter a value: org/repo-name
```

## Test GithHub Workflow

This Workflow uses `aws sts get-caller-identity` to test permissions.

```yaml
name: Test OIDC Integration
on:
  push:

jobs:
  test:
    permissions:
      id-token: write
    runs-on: ubuntu-latest
    steps:
      - name: configure aws credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: arn:aws:iam::${{ secrets.AWS_ACCOUNT_ID }}:role/github-actions/repo-name
          role-session-name: gh-actions
          aws-region: us-east-1

      - run: |
          aws sts get-caller-identity
```

## Clean Up
```bash
terraform destory
```

### Runtime 
Terraform v1.9.3
on darwin_amd64
