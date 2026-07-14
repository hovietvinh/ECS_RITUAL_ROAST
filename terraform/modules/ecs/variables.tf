variable "project_template" {
  type = string
}

variable "region" {
  type = string
}

variable "ecs_memory" {
  type = string
}

variable "ecs_cpu" {
  type = string
}

variable "db_server" {
  type = string
}

variable "db_database" {
  type = string
}

variable "db_secret_name" {
  type = string
}

variable "subnets_app" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "target_group_arn" {
  type = string
}