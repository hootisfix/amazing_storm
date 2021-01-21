resource "aws_lambda_function" "super_code_tempete" {
  function_name = "myfunc"
  s3_bucket     = var.b-super_code_tempete
  s3_key        = "super_code_tempete.zip"
  role          = var.role_for_LDC
  handler       = "super_code_tempete.handler"
  runtime       = "nodejs12.x"
}
