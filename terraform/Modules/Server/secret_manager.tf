# resource "aws_secretsmanager_secret" "key_pair_2" {
#   name                    = "key-pair-2"
#   recovery_window_in_days = 0

# }

# resource "aws_secretsmanager_secret_version" "key_pair_2" {
#   secret_id     = aws_secretsmanager_secret.key_pair_2.id
#   secret_string = tls_private_key.Key_1.private_key_pem

# }