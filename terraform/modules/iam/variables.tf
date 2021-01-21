variable "region" {
  description = "AWS region where resources are deployed"
  type        = string
}
variable "common_tags" {
  description = "Tags to be applied for aws resources"
  type        = map(string)
}
variable "dynamodb_arn" {
  description = "Arn of dynamoDB database"
  type        = string
}
