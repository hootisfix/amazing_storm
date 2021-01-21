resource "aws_dynamodb_table" "ddbtable" {
  name           = "myDB"
  hash_key       = "id"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  attribute {
    name = "id"
    type = "S"
  }
  tags = var.common_tags
}