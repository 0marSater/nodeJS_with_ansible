resource "aws_lb" "my_alb" {
  name               = var.alb_name
  internal           = var.is_alb_internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [var.alb_sg]
  subnets            = var.alb_subnets
}