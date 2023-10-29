resource "aws_elasticache_subnet_group" "my_redis_subnet_group" {
  name       = "my-redis-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "My redis subnet group"
  }
}