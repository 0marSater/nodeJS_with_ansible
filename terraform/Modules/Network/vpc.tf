resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cider
  enable_dns_hostnames = var.enable_dns_hostnames #true
  tags = {
    Name = var.vpc_name
  }

}