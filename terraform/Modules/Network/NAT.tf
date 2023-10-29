resource "aws_eip" "nat_ip" {
  domain = "vpc"
  tags = {
    Name = "NAT-EIP"
  }
}


resource "aws_nat_gateway" "NAT_Gateway" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "NAT-Gateway"
  }

}


