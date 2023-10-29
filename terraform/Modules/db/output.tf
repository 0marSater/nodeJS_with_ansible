output "db_name" {
  value       = aws_db_instance.mydb_instance.db_name
}

output "db_endpoint" {
  value       = aws_db_instance.mydb_instance.address
}

