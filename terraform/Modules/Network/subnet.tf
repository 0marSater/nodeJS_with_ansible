
resource "aws_subnet" "public_subnet_1" {
  depends_on = [
    aws_vpc.my_vpc
  ]
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_1_ip
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true 
  tags = {
    Name = var.public_subnet_1_name
  }

}


resource "aws_subnet" "public_subnet_2" {
  depends_on = [
    aws_vpc.my_vpc
  ]
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_2_ip
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_2_name
  }
}

resource "aws_subnet" "private_subnet_1" {
  depends_on = [
    aws_vpc.my_vpc
  ]
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_1_ip
  availability_zone = "${var.region}a"

  tags = {
    Name = var.private_subnet_1_name
  }
}

resource "aws_subnet" "private_subnet_2" {
  depends_on = [
    aws_vpc.my_vpc
  ]
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_2_ip
  availability_zone = "${var.region}b"
  tags = {
    Name = var.private_subnet_2_name
  }
}
