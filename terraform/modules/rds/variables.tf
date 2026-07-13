variable "subnets_db" {
  type = list(string)
}

variable "db_family" {
  type        = string
}

variable "db_engine" {
  type = string
}
variable "project_template" {
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

variable "data_sg_id" {
  type = list(string)
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