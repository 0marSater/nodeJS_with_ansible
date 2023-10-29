output "bastion_public_ip_1" {
  value = module.servers.instance_public_ip_1
}


output "master_public_ip" {
  value = module.servers.master_public_ip
}

output "slave_private_ip" {
  value = module.servers.slave_private_ip
}


output "application_private_ip" {
  value = module.servers.application_private_ip
}

output "db_name" {
  value = module.db.db_name
}

output "db_endpoint" {
  value = module.db.db_endpoint
}

output "redis_endpoint" {
  value = module.redis.redis_endpoint
}

output "alb_dns_name" {
  value = module.alb.alb_endpoint
}

