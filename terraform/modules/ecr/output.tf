output "ecr_repository_name" {
  value       = aws_ecr_repository.this.name
}

output "ecr_registry_url" {
  value       = aws_ecr_repository.this.repository_url
}