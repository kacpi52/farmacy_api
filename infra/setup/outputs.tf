output "cd_user_access_key_id" {
  description = "aws key id for cicd user"
  value       = aws_iam_access_key.cd.id
}

output "cd_user_access_key_secret" {
  description = "aws access key secret for cicd user"
  value       = aws_iam_access_key.cd.secret
  sensitive   = true
}

output "ecr_repo_app" {
  description = "ecr repository app image URL"
  value       = aws_ecr_repository.app.repository_url
}

output "ecr_repo_proxy" {
  description = "ecr repository proxy image URL"
  value       = aws_ecr_repository.proxy.repository_url
}