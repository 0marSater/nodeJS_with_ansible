output "instance_public_ip_1" {
  value = aws_instance.bastion_1.public_ip
}


output "master_public_ip" {
  value = aws_instance.jenkins_master.public_ip
}


output "slave_private_ip" {
  value = aws_instance.private_instance_1.private_ip
}


output "application_private_ip" {
  value = aws_instance.private_instance_2.private_ip
}


# output "instance_private_id_1" {
#   value = aws_instance.private_instance_1.id
# }


# output "instance_private_id_2" {
#   value = aws_instance.private_instance_2.id
# }


# output "instance_public_id_2" {
#   value = aws_instance.bastion_2.id
# }

output "private_instance_ids" {
  value = [aws_instance.private_instance_2.id]
}





