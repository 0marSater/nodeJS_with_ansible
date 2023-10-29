terraform {
  backend "s3" {
    bucket         = "big-bucket-1234"
    key            = "terraform-state-files"
    region         = "eu-west-1"
    dynamodb_table = "state_file_lock"
  }
}