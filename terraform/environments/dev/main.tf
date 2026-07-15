module "ecr" {
  source = "../../modules/ecr"
  ecr_image_count = var.ecr_image_count
  project_template = var.project_template
}

module "sg" {
  source = "../../modules/sg"
  vpc_id = var.vpc_id
  project_template = var.project_template
}

module "rds" {
  source = "../../modules/rds"
  project_template = var.project_template
  subnets_db = var.subnets_db
  db_family = var.db_family
  db_engine = var.db_engine
  db_engine_version = var.db_engine_version
  db_instance_class = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_max_allocated_storage = var.db_max_allocated_storage
  db_storage_type = var.db_storage_type
  db_multi_az = var.db_multi_az
  data_sg_id = [module.sg.data_sg_id]
  db_publicly_accessible = var.db_publicly_accessible
  db_skip_final_snapshot = var.db_skip_final_snapshot
  db_deletion_protection = var.db_deletion_protection
  db_port = var.db_port
  db_name = var.db_name
  db_username = var.db_username
  db_manage_master_user_password = var.db_manage_master_user_password
}

module "alb" {
  source = "../../modules/alb"
  project_template = var.project_template
  lb_internal = var.lb_internal
  subnets_alb = var.subnets_alb
  alb_sg_id = [module.sg.public_sg_id]
  vpc_id = var.vpc_id
  target_type = var.target_type
}

module "ecs" {
  source = "../../modules/ecs"
  project_template = var.project_template
  region = var.region
  ecs_cpu = var.ecs_cpu
  ecs_memory = var.ecs_memory
  db_server = module.rds.db_server
  db_database = module.rds.db_database
  db_secret_name= module.rds.db_secret_name
  subnets_app = var.subnets_app
  security_groups = [module.sg.app_sg_id]
  target_group_arn = module.alb.target_group_arn
}