resource "aws_db_subnet_group" "this" {
  name       = "${var.project_template}_subnet_group"
  subnet_ids = var.subnets_db

  tags = {
    Name = "ritual_roast_subnet_group"
  }
}

resource "aws_db_parameter_group" "this" {
  name   = "${var.project_template}_pg"
  family = var.db_family
  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_connection"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_database"
    value = "utf8mb4"
  }
}

resource "aws_db_instance" "this" {
  identifier = "${var.project_template}_mysql"
  engine = var.db_engine
  engine_version         = var.db_engine_version

  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage

  max_allocated_storage  = var.db_max_allocated_storage
  storage_type           = var.db_storage_type
  multi_az               = var.db_multi_az

  parameter_group_name   = aws_db_parameter_group.this.name
  db_subnet_group_name   = aws_db_subnet_group.this.name

  vpc_security_group_ids = var.data_sg_id
  publicly_accessible    = var.db_publicly_accessible
  skip_final_snapshot    = var.db_skip_final_snapshot
  deletion_protection    = var.db_deletion_protection

  db_name  = var.db_name
  username = var.db_username
  manage_master_user_password = var.db_manage_master_user_password

  port     = var.db_port

  tags = {
    Name        = "${var.project_template}-mysql"
  }

}