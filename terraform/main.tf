module "network" {
  source                = "./modules/Network"
  region                = var.region
  vpc_cider             = var.vpc_cider
  vpc_name              = var.vpc_name
  enable_dns_hostnames  = var.enable_dns_hostnames
  public_subnet_1_name  = var.public_subnet_1_name
  public_subnet_1_ip    = var.public_subnet_1_ip
  public_subnet_2_name  = var.public_subnet_2_name
  public_subnet_2_ip    = var.public_subnet_2_ip
  private_subnet_1_name = var.private_subnet_1_name
  private_subnet_1_ip   = var.private_subnet_1_ip
  private_subnet_2_name = var.private_subnet_2_name
  private_subnet_2_ip   = var.private_subnet_2_ip
  public_rt_name        = var.public_rt_name
  public_rt_cider       = var.public_rt_cider
  private_rt_name       = var.private_rt_name
  private_rt_cider      = var.private_rt_cider
}

module "servers" {
  source                  = "./modules/Server"
  instances_type          = var.instances_type
  bastion_instance_1_name = var.bastion_instance_1_name
  app_instance_name       = var.app_instance_name
  master_instance_name    = var.master_instance_name
  slave_instance_name     = var.slave_instance_name
  key_pair_name           = var.key_pair_name
  key_pair_2_name         = var.key_pair_2_name
  public_subnet_1_id      = module.network.public_subnet_1_id
  public_subnet_2_id      = module.network.public_subnet_2_id
  public_sg_1_id          = module.network.public_sg_1_id
  public_sg_2_id          = module.network.public_sg_2_id
  private_subnet_1_id     = module.network.private_subnet_1_id
  private_subnet_2_id     = module.network.private_subnet_2_id
  private_sg_1_id         = module.network.private_sg_1_id
  private_sg_2_id         = module.network.private_sg_2_id

}

module "db" {
  source               = "./modules/db"
  allocated_storage    = var.allocated_storage
  identifier           = var.identifier
  db_name              = var.db_name
  db_version           = var.db_version
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  db_password          = var.db_password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
  rds_sg_id            = module.network.rds_sg_id
  private_subnet_ids   = module.network.private_subnet_ids
}


module "redis" {
  source                       = "./modules/redis"
  redis_name                   = var.redis_name
  cluster_id                   = var.cluster_id
  clueter_engine               = var.clueter_engine
  node_type                    = var.node_type
  num_cache_nodes              = var.num_cache_nodes
  cluster_parameter_group_name = var.cluster_parameter_group_name
  cluster_engine_version       = var.cluster_engine_version
  port                         = var.port
  redis_sg_id                  = module.network.redis_sg_id
  private_subnet_ids           = module.network.private_subnet_ids
}



module "alb" {
  source             = "./modules/alb"
  alb_name           = var.alb_name
  is_alb_internal    = var.is_alb_internal
  load_balancer_type = var.load_balancer_type
  alb_sg             = module.network.public_sg_1_id
  alb_subnets        = module.network.public_subnet_ids
  target_group_name  = var.target_group_name
  alb_port           = var.alb_port
  protocol           = var.protocol
  vpc_id             = module.network.vpc_id
  health_check = {
    timeout             = var.health_check["timeout"]
    interval            = var.health_check["interval"]
    path                = var.health_check["path"]
    port                = var.health_check["port"]
    unhealthy_threshold = var.health_check["unhealthy_threshold"]
    healthy_threshold   = var.health_check["healthy_threshold"]
  }
  instance_ids        = module.servers.private_instance_ids
  default_action_type = var.default_action_type
}

