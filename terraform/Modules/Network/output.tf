output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}


output "public_subnet_ids" {
  value       = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  description = "only used for attribute subnets in alb module." 
}

output "private_subnet_1_id" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_subnet_2.id
}

output "private_subnet_ids" {
  value       = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  description = "only used for attribute subnets in redis and rds module." 
}

output "private_sg_1_id" {
  value = aws_security_group.private_sg_1.id
}

output "private_sg_2_id" {
  value = aws_security_group.private_sg_2.id
}


output "public_sg_1_id" {
  value = aws_security_group.public_sg_1.id
}

output "public_sg_2_id" {
  value = aws_security_group.public_sg_2.id
}


output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}

output "redis_sg_id" {
  value = aws_security_group.redis_sg.id
}

