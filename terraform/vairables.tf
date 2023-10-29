
variable "region" {
  type        = string
  description = "Region name"
}

########################### Public Subnet-1#########################

variable "vpc_cider" {
  type        = string
  description = "VPC IP"
}


variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames."
}


variable "vpc_name" {
  type        = string
  description = "VPC name"
}

########################### Public Subnet-1 #########################
variable "public_subnet_1_name" {
  type        = string
  description = "Public subnet-1 name"
}


variable "public_subnet_1_ip" {
  type        = string
  description = "Publuc subnet-1 ip"
}


variable "public_subnet_2_name" {
  type        = string
  description = "Public subnet-2 name"
}


variable "public_subnet_2_ip" {
  type        = string
  description = "Publuc subnet-2 ip"
}


########################### Private Subnet-1 #########################

variable "private_subnet_1_name" {
  type        = string
  description = "Private subnet-1 name"
}


variable "private_subnet_1_ip" {
  type        = string
  description = "Private subnet-1 ip"
}

variable "private_subnet_2_name" {
  type        = string
  description = "Private subnet-2 name"
}


variable "private_subnet_2_ip" {
  type        = string
  description = "Private subnet-2 ip"
}

########################### Public Route Table #########################

variable "public_rt_name" {
  type        = string
  description = "Public route table name"
}

variable "public_rt_cider" {
  type        = string
  description = "Public route table cider block"
}


########################### Private Route Table #########################

variable "private_rt_name" {
  type        = string
  description = "Private route table name"
}

variable "private_rt_cider" {
  type        = string
  description = "Private route table cider block"
}

########################### Servers #########################

variable "instances_type" {
  type        = list(string)
  description = "Type of instances"
}

variable "bastion_instance_1_name" {
  type        = string
  description = "Name of public instance 1 "
}

variable "master_instance_name" {
  type        = string
  description = "Name of public instance 2 (jenkins master) "
}

variable "slave_instance_name" {
  type        = string
  description = "Name of private instance 1 (jenkins slave)"
}


variable "app_instance_name" {
  type        = string
  description = "Name of private instance 2 (app)"
}


variable "key_pair_name" {
  type        = string
  description = "Private Key 1 name"
}

variable "key_pair_2_name" {
  type        = string
  description = "Private Key 2 name"
}


########################### Database #########################

variable "allocated_storage" {
  description = "Amount of allocated storage in GB"
  type        = number
}

variable "identifier" {
  description = "Name of the db_instance"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}


variable "db_version" {
  description = "Database engine"
  type        = string
}

variable "engine_version" {
  description = "Version of the database engine"
  type        = string
}

variable "instance_class" {
  description = "Instance class for the database"
  type        = string
}

variable "username" {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
}

variable "parameter_group_name" {
  description = "Name of the parameter group"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot when deleting the database"
  type        = bool
}



########################### Redis #########################

variable "redis_name" {
  description = "A name tag for the Redis cluster"
  type        = string
}
variable "cluster_id" {
  description = "The ID for the Redis cluster"
  type        = string
}

variable "clueter_engine" {
  description = "The Redis engine type (e.g., 'redis')"
  type        = string
}

variable "node_type" {
  description = "The type of cache node to be used in this cache cluster"
  type        = string
}

variable "num_cache_nodes" {
  description = "The number of cache nodes in the cluster"
  type        = number
}

variable "cluster_parameter_group_name" {
  description = "The name of the parameter group to associate with this Redis cluster"
  type        = string
}

variable "cluster_engine_version" {
  description = "The Redis engine version"
  type        = string
}

variable "port" {
  description = "The port on which the Redis endpoint listens"
  type        = number
}


########################### ALB #########################

variable "alb_name" {
  description = "The name of the ALB."
  type        = string
}

variable "is_alb_internal" {
  description = "Whether the ALB is internal (true) or external (false)."
  type        = bool
}

variable "load_balancer_type" {
  description = "The type of the load balancer (e.g., application)."
  type        = string
}


variable "target_group_name" {
  description = "The name of the ALB Target Group."
  type        = string
  default     = "tf-example-lb-tg"
}

variable "alb_port" {
  description = "The port on which the Target Group receives traffic."
  type        = number
}

variable "protocol" {
  description = "The protocol to use for routing traffic to the targets (e.g., HTTP, HTTPS, TCP)."
  type        = string
}


variable "health_check" {
  type = map(string)
}



variable "default_action_type" {
  description = "The default action type of the ALB listner."
  type        = string
}



