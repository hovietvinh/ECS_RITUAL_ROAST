// ecr
output "ecr_repository_name" {
  value       = module.ecr.ecr_repository_name 
}

output "ecr_registry_url" {
  value       = module.ecr.ecr_registry_url 
}

// ecs
output "ecs_cluster" {
  value = module.ecs.ecs_cluster
}

output "ecs_service" {
  value = module.ecs.ecs_service
}

output "ecs_task_definition" {
  value = module.ecs.ecs_task_definition
}

output "alb_dns_name" {
  value       = module.alb.alb_dns_name
}