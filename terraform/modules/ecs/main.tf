resource "aws_ecs_cluster" "this" {
  name = "${var.project_template}_ecs_cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "this" {
  family                   = "${var.project_template}_task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.ecs_cpu
  memory                   = var.ecs_memory
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions = jsonencode([
    {
      name      = "ritualroast"
      image     = "nginx:alpine" 
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "DB_SERVER"
          value = var.db_server
        },
        {
          name  = "DB_DATABASE"
          value = var.db_database
        },
        {
          name  = "SECRET_NAME"
          value = var.db_secret_name
        },
        {
          name  = "AWS_REGION"
          value = var.region
        }
      ]
    }
  ])
  
  # Đã XOÁ block lifecycle ở đây
}

resource "aws_ecs_service" "this" {
  name            = "${var.project_template}_service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    subnets = var.subnets_app
    security_groups = var.security_groups
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "ritualroast"
    container_port   = 80
  }

  lifecycle {
    ignore_changes = [
      task_definition,
      desired_count
    ]
  }
}