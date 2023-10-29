output "alb_endpoint" {
  value = aws_lb.my_alb.dns_name
}
