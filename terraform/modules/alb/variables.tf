variable "project_template" {
  type = string
}

variable "lb_internal" {
  type = bool
}

variable "subnets_alb" {
  type = list(string)
}

variable "alb_sg_id" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}
variable "target_type" {
  type = string
}