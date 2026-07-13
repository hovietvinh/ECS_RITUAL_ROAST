module "ecr" {
  source = "../../modules/ecr"
  ecr_image_count = var.ecr_image_count
  project_template = var.project_template
}
