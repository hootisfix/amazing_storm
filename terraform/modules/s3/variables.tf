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