
resource "tls_private_key" "Key_1" {
  algorithm = "RSA"
  rsa_bits  = 4096

}

resource "aws_key_pair" "Key_1" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.Key_1.public_key_openssh
}

resource "local_file" "private_key_file_1" {
  filename = "key_1.pem"
  content  = tls_private_key.Key_1.private_key_pem
}



resource "tls_private_key" "Key_2" {
  algorithm = "RSA"
  rsa_bits  = 4096

}

resource "aws_key_pair" "Key_2" {
  key_name   = var.key_pair_2_name
  public_key = tls_private_key.Key_2.public_key_openssh
}

resource "local_file" "private_key_file_2" {
  filename = "key_2.pem"
  content  = tls_private_key.Key_2.private_key_pem
}