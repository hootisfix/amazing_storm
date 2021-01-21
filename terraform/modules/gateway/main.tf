resource "aws_api_gateway_rest_api" "apiLambda" {
  name = "myAPI"

}


resource "aws_api_gateway_resource" "Resource" {
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  parent_id   = aws_api_gateway_rest_api.apiLambda.root_resource_id
  path_part   = "myresource"

}


resource "aws_api_gateway_method" "Method" {
  rest_api_id   = aws_api_gateway_rest_api.apiLambda.id
  resource_id   = aws_api_gateway_resource.Resource.id
  http_method   = "POST"
  authorization = "NONE"
}


resource "aws_api_gateway_integration" "lambdaInt" {
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  resource_id = aws_api_gateway_resource.Resource.id
  http_method = aws_api_gateway_method.Method.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.super_code_tempete-invokearn

}


resource "aws_api_gateway_deployment" "apideploy" {
  depends_on = [aws_api_gateway_integration.lambdaInt]

  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  stage_name  = var.env
}


resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.super_code_tempete-name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.apiLambda.execution_arn}/${var.env}/POST/myresource"

}
