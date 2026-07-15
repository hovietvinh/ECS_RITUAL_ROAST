variable "region" {
  type = string
}

variable "env" {
  type = string
}

variable "project_template" {
  type = string
}

variable "ecr_image_count" {
  type = number
}

variable "vpc_id" {
  type = string
}

variable "subnets_db" {
  type = list(string)
}


variable "db_family" {
  type        = string
}

variable "db_engine" {
  type = string
}

variable "db_engine_version" {
  type = string
}

variable "db_instance_class" {
  type = string
}

variable "db_allocated_storage" {
  type = number
}

variable "db_max_allocated_storage" {
  type = number
}

variable "db_storage_type" {
  type = string
}

variable "db_multi_az" {
  type = bool
}


variable "db_publicly_accessible" {
  type = bool
}

variable "db_skip_final_snapshot" {
  type = bool
}

variable "db_deletion_protection" {
  type = bool
}

variable "db_port" {
  type = number
}

variable "db_name" {
  type = string
}
variable "db_username" {
  type = string
}
variable "db_manage_master_user_password" {
  type = bool
}

//alb
variable "target_type" {
  type = string
}
variable "lb_internal" {
  type = bool
}
variable "subnets_alb" {
  type = list(string)
}

variable "ecs_cpu" {
  type = string
}

variable "ecs_memory" {
  type = string
}


variable "db_server" {
  type = string
}

variable "db_database" {
  type = string
}

variable "subnets_app" {
  type = list(string)
}