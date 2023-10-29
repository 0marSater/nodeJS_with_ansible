# public rt
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.public_rt_cider
    gateway_id = aws_internet_gateway.vpc_gw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

# private rt
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block     = var.private_rt_cider
    nat_gateway_id = aws_nat_gateway.NAT_Gateway.id
  }

  tags = {
    Name = var.private_rt_name
  }
}

resource "aws_route_table_association" "attach_public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "attach_public_subnet_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "attach_private_subnet_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "attach_private_subnet_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}


