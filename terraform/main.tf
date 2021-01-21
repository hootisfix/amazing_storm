# Configure Terraform
terraform {
  required_version = ">=0.12.0"
  backend "s3" {} # empty, config is in a file because interpolation is not available in backend block
}

# Configure the AWS Provider
provider "aws" {
  version = ">=2.0.0"
  region  = var.region
}

data "aws_caller_identity" "current" {}


module "s3" {
  source      = "./modules/s3"
  region      = var.region
  common_tags = var.common_tags
  env         = var.env
}

module database {
  source      = "./modules/database"
  region      = var.region
  common_tags = var.common_tags
}

module function {
  source               = "./modules/function"
  region               = var.region
  common_tags          = var.common_tags
  role_for_LDC         = module.iam.role_for_LDC
  b-super_code_tempete = module.s3.b-super_code_tempete
}

module iam {
  source      = "./modules/iam"
  region      = var.region
  common_tags = var.common_tags
  dynamodb_arn = module.database.dynamodb_arn
}

module gateway {
  source                       = "./modules/gateway"
  region                       = var.region
  env                          = var.env
  common_tags                  = var.common_tags
  super_code_tempete-invokearn = module.function.super_code_tempete-invokearn
  super_code_tempete-name      = module.function.super_code_tempete-name
}