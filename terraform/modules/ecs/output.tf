output "ecs_cluster" {
  value = aws_ecs_cluster.this.name
}

output "ecs_service" {
  value = aws_ecs_service.this.name
}

output "ecs_task_definition" {
  value = aws_ecs_task_definition.this.family
}