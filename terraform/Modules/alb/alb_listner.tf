resource "aws_lb_listener" "alb_listner" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = var.alb_port
  protocol          = var.protocol

  default_action {
    type             = var.default_action_type
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}
