
resource "aws_lambda_function" "terraform_lambda_func" {
function_name                  = "Automate_next_Lambda_Function"
role                           = aws_iam_role.lambda_role_output
handler                        = "index.lambda_handler"
runtime                        = "python3.8"
}
