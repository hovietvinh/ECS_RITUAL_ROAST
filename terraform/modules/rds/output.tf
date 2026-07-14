output "db_server" {
  value = aws_db_instance.this.address
}

output "db_database" {
  value = aws_db_instance.this.db_name
}

output "db_secret_name" {
  value = aws_db_instance.this.master_user_secret[0].secret_arn 
}