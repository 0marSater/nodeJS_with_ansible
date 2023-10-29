# variables.tf

variable "allocated_storage" {
  description = " Amount of allocated storage in GB"
  type        = number
}

variable "identifier" {
  description = "Name of the db_instance"
  type        = string
}


variable "db_name" {
  description = " Name of the database"
  type        = string
}

variable "db_version" {
  description = " Database engine"
  type        = string
}

variable "engine_version" {
  description = " Version of the database engine"
  type        = string
}

variable "instance_class" {
  description = " Instance class for the database"
  type        = string
}

variable "username" {
  description = " Username for the database"
  type        = string
}

variable "db_password" {
  description = " Password for the database"
  type        = string
}

variable "parameter_group_name" {
  description = " Name of the parameter group"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot when deleting the database"
  type        = bool
}



variable "private_subnet_ids" {
  description = "IDs of private subent"
  type        = list(string)
}



variable "rds_sg_id" {
  description = "RDS Security id"
  type        = string
}




