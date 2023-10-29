resource "aws_lb_target_group" "alb_tg" {
  name                  = var.target_group_name 
  port                  = var.alb_port              
  protocol              = var.protocol          
  vpc_id                = var.vpc_id

  health_check {
    healthy_threshold   = var.health_check["healthy_threshold"]
    interval            = var.health_check["interval"]
    unhealthy_threshold = var.health_check["unhealthy_threshold"]
    timeout             = var.health_check["timeout"]
    path                = var.health_check["path"]
    port                = var.health_check["port"]
  }
}


resource "aws_lb_target_group_attachment" "tg_attachment" {
  for_each         = { for idx, instance_id in var.instance_ids : idx => instance_id }
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = each.value
}