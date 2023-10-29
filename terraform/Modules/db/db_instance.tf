resource "aws_db_instance" "mydb_instance" {
    allocated_storage    = var.allocated_storage 
    identifier           = var.identifier       
    db_name              = var.db_name
    engine               = var.db_version 
    engine_version       = var.engine_version 
    instance_class       = var.instance_class 
    username             = var.username
    password             = var.db_password 
    parameter_group_name = var.parameter_group_name 
    skip_final_snapshot  = var.skip_final_snapshot 
    vpc_security_group_ids = [var.rds_sg_id]
    db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name

}