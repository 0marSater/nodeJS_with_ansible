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



variable "public_subnet_1_id" {
  type        = string
  description = "ID of public instance 1"
}


variable "public_subnet_2_id" {
  type        = string
  description = "ID of public instance 2"
}



variable "private_subnet_1_id" {
  type        = string
  description = "ID of private subnet 1"
}

variable "private_subnet_2_id" {
  type        = string
  description = "ID of private subnet 2"
}


variable "public_sg_1_id" {
  type        = string
  description = "ID of public security group 1"
}


variable "public_sg_2_id" {
  type        = string
  description = "ID of public security group 2"
}



variable "private_sg_1_id" {
  type        = string
  description = "ID of private application security group"
}


variable "private_sg_2_id" {
  type        = string
  description = "ID of private slave security group"
}

variable "key_pair_name" {
  type        = string
  description = "Private Key 1 name"
}

variable "key_pair_2_name" {
  type        = string
  description = "Private Key 2 name"
}



