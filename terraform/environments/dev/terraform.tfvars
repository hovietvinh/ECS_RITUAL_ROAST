// shared
region = "ap-southeast-1"
env = "dev"
project_template = "ritual_roast_dev"
vpc_id = ""

//ecr
ecr_image_count = 10

//rds
subnets_db = []
db_family = "mysql8.0"
db_engine = "mysql"
db_engine_version = "8.0"
db_instance_class = "db.t3.micro"
db_allocated_storage = 20
db_max_allocated_storage = 0
db_storage_type = "gp2"
db_multi_az = false
db_publicly_accessible = false
db_skip_final_snapshot = true
db_deletion_protection = false
db_port = 3306
db_name = "ritualroastdb"
db_username = "admin"
db_manage_master_user_password = true

// alb
lb_internal = false
target_type = "ip"
subnets_alb = []

//ecs
ecs_cpu = "256"
ecs_memory = "512"
subnets_app = []
