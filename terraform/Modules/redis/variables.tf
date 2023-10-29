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

variable "redis_sg_id" {
  description = "The security group ID to associate with the Redis cluster"
  type        = string
}

variable "port" {
  description = "The port on which the Redis endpoint listens"
  type        = number
}

variable "redis_name" {
  description = "A name tag for the Redis cluster"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs of private subent"
  type        = list(string)
}
