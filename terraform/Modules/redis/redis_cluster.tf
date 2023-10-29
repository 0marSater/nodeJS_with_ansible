
resource "aws_elasticache_cluster" "my_redis" {
  cluster_id           = var.cluster_id
  engine               = var.clueter_engine
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.cluster_parameter_group_name
  engine_version       = var.cluster_engine_version
  security_group_ids   = [var.redis_sg_id]
  subnet_group_name    = aws_elasticache_subnet_group.my_redis_subnet_group.name

  tags = {
    Name = var.redis_name
  }

  port = var.port
}

