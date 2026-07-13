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
