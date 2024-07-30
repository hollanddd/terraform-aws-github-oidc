output "roles" {
  value = {
    repo_name = module.oidc_repo_name.role.name
  }
}

