resource "aws_s3_bucket" "b-website" {
  bucket = "${var.env}-tempete-de-direct.savarit.net"
  acl    = "public-read"
  tags   = var.common_tags

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}

resource "aws_s3_bucket" "b-super_code_tempete" {
  bucket = "${var.env}-super-code-tempete"
  acl    = "private"
  tags   = var.common_tags
}
