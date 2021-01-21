variable "region" {
  description = "AWS region where resources are deployed"
  type        = string
}
variable "common_tags" {
  description = "Tags to be applied for aws resources"
  type        = map(string)
  default     = {}
}
variable "env" {
  description = "Working environment (prod/dev/valid...)"
  type        = string
}
variable "super_code_tempete-name" {
  description = "Name of the lambda function"
  type        = string
}
variable "super_code_tempete-invokearn" {
  description = "Invoke ARN of the lambda function"
  type        = string
}