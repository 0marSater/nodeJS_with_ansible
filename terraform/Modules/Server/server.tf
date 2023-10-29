data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}


resource "aws_instance" "bastion_1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instances_type[0]
  subnet_id              = var.public_subnet_1_id
  vpc_security_group_ids = [var.public_sg_1_id]
  key_name               = aws_key_pair.Key_1.key_name
  tags = {
    Name = var.bastion_instance_1_name
  }

}

resource "aws_instance" "jenkins_master" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instances_type[1]
  subnet_id              = var.public_subnet_2_id
  vpc_security_group_ids = [var.public_sg_2_id]
  key_name               = aws_key_pair.Key_2.key_name
  tags = {
    Name = var.master_instance_name
  }
}


resource "aws_instance" "private_instance_1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instances_type[2]
  subnet_id              = var.private_subnet_1_id
  vpc_security_group_ids = [var.private_sg_1_id]
  key_name               = aws_key_pair.Key_2.key_name

  tags = {
    Name = var.slave_instance_name
  }
}



resource "aws_instance" "private_instance_2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instances_type[3]
  subnet_id              = var.private_subnet_2_id
  vpc_security_group_ids = [var.private_sg_2_id]
  key_name               = aws_key_pair.Key_1.key_name

  tags = {
    Name = var.app_instance_name
  }
}

