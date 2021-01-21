variable "region" {
  description = "AWS region where resources are deployed"
  type        = string
}
variable "common_tags" {
  description = "Tags to be applied for aws resources"
  type        = map(string)
  default     = {}
}
variable "role_for_LDC" {
  description = "Role for lambda function"
  type        = string
}
variable "b-super_code_tempete" {
  description = "Bucket for lambda function storage"
  type        = string
}