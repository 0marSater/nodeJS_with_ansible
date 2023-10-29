output "redis_endpoint" {
  value       = [

    for node in aws_elasticache_cluster.my_redis.cache_nodes:
    {
      address = node.address
      port    = node.port
    }
  ]
  description = "URL and port of the redis node"

}
