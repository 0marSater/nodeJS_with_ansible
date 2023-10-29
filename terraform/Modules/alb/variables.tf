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

variable "alb_sg" {
  description = "A list of security group IDs for the ALB."
  type        = string
}

variable "alb_subnets" {
  description = "List of ALB subnets."
  type        = list(string)
}
 
variable "target_group_name" {
  description = "The name of the ALB Target Group."
  type        = string
}

variable "alb_port" {
  description = "The port on which the Target Group receives traffic."
  type        = number
}

variable "protocol" {
  description = "The protocol to use for routing traffic to the targets (e.g., HTTP, HTTPS, TCP)."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC in which to create the Target Group."
  type        = string
}

variable "health_check" {
  type = map(string)
}


variable "instance_ids" {
  description = "List of target instances's id."
  type = list(string)
}

variable "default_action_type" {
  description = "The default action type of the ALB listner."
  type        = string
}

