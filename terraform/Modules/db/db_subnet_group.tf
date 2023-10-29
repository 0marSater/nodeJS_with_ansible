resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}