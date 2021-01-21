resource "aws_iam_role_policy" "lambda_policy" {
  name   = "lambda_policy"
  role   = aws_iam_role.role_for_LDC.id
  policy = templatefile("modules/iam/policy.json", { dynamodb_arn = var.dynamodb_arn })
}


resource "aws_iam_role" "role_for_LDC" {
  name               = "lambdarole"
  assume_role_policy = file("modules/iam/assume_role_policy.json")
}

