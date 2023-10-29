
variable "region" {
  type        = string
  description = "Region name"
}

########################### Public Subnet-1#########################

variable "vpc_cider" {
  type        = string
  description = "VPC IP"
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




variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames."
}






