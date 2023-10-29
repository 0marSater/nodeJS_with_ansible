region                  = "eu-west-1"
vpc_cider               = "10.0.0.0/16"
vpc_name                = "my-vpc"
enable_dns_hostnames    = true
public_subnet_1_name    = "Public-Subent-1"
public_subnet_1_ip      = "10.0.1.0/24"
public_subnet_2_name    = "Public-Subnet-2"
public_subnet_2_ip      = "10.0.2.0/24"
private_subnet_1_name   = "Private-Subent-1"
private_subnet_1_ip     = "10.0.3.0/24"
private_subnet_2_name   = "Private-Subent-2"
private_subnet_2_ip     = "10.0.4.0/24"
public_rt_name          = "Public-rt"
public_rt_cider         = "0.0.0.0/0"
private_rt_name         = "Private-rt"
private_rt_cider        = "0.0.0.0/0"
instances_type          = ["t2.micro", "t2.micro", "t2.micro", "t2.micro"]
bastion_instance_1_name = "Bastion-1"
app_instance_name       = "Application-1"
master_instance_name    = "Jenkins-Master"
slave_instance_name     = "Slave-1"
key_pair_name           = "key-1"
key_pair_2_name         = "key-2"

#rds

allocated_storage    = 10
identifier           = "instance"
db_name              = "mydb"
db_version           = "mysql"
engine_version       = "5.7"
instance_class       = "db.t3.micro"
username             = "rds"
db_password          = "rds1234"
parameter_group_name = "default.mysql5.7"
skip_final_snapshot  = true


#redis 
redis_name                   = "MyRedisCluster"
cluster_id                   = "my-redis-cluster"
clueter_engine               = "redis"
node_type                    = "cache.t4g.micro"
num_cache_nodes              = 1
cluster_parameter_group_name = "default.redis5.0"
cluster_engine_version       = "5.0.6"
port                         = 6379


#alb
alb_name           = "MyALB"
is_alb_internal    = false
load_balancer_type = "application"
target_group_name  = "MyTargetGroup"
alb_port           = "80"
protocol           = "HTTP"
health_check = {
  timeout             = "15"
  interval            = "30"
  path                = "/health"
  port                = "8080"
  unhealthy_threshold = "3"
  healthy_threshold   = "2"
}
default_action_type = "forward"

